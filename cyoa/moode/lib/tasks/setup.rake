require 'pry'

namespace :moode do
  desc "Clear Staging"
  task :clear_staging => :environment do
    puts "--------------------**** Clearing Staging Table ****--------------------"
    ActiveRecord::Base.connection.execute("delete from staging")
    puts "--------------------**** Staging Table Cleared ****--------------------"
  end

  desc "Update Messages"
  task :update => :environment do
    begin
      #csv_file = Message.update_from_slack 3, "C02GW6C7N"
      Channel.update_from_slack
      begin
        csv_file, fetch_table = fetch_table ? Message.update_channels((fetch_table.select { |channel, info| channel if info[:has_more] }) \
                                              .keys.map { |channel_slack_id| channel_slack_id.to_s }).values \
                                            : Message.update_all_channels.values
        has_more = fetch_table.any? { |channel, info| info[:has_more] }
        Rake::Task['moode:clear_staging'].reenable
        Rake::Task['moode:clear_staging'].invoke
        puts "--------------------**** Loading new data ****--------------------"
        puts "--------------------**** Copying to Staging ****--------------------"
        ActiveRecord::Base.connection.execute("copy staging (type, text, ts, score, user_id, channel_id) from '#{csv_file.path}' with header csv delimiter ',' quote '\"'")
        ActiveRecord::Base.connection.execute("update staging set timestamp = to_timestamp(ts)")
        puts "--------------------**** Copying to Staging: Complete ****--------------------"
        puts "--------------------**** Auto-partitioning / Checking if partitions up-to-date on Messages ****--------------------"
        autopartition_messages
        puts "--------------------**** Partitioning Complete ****--------------------"
        puts "--------------------**** Copying to Messages ****--------------------"
        ActiveRecord::Base.connection.execute("insert into messages (type, text, ts, score, user_id, channel_id, timestamp) select st.type, st.text, st.ts, st.score, st.user_id, st.channel_id, st.timestamp from staging st")
        puts "--------------------**** Copying to Messages: Complete ****--------------------"
      end until !has_more
      puts "--------------------**** Load Complete ****--------------------"
    rescue RuntimeError => e
      puts "Update Messages failed with error: #{e}"
    ensure
      csv_file.close && csv_file.unlink unless csv_file.nil?
    end
  end
end

def extract_partition_elements(partitionable)
  partition_elements = partitionable["partitionables"].delete("()").split(",")
  two_digit_month = partition_elements[0].length == 2 ? partition_elements[0] : "0#{partition_elements[0]}"
  year = partition_elements[1]
  adjusted_year = year
  adjusted_month = two_digit_month
  if two_digit_month.to_i == 12
    adjusted_month = 0
    adjusted_year = adjusted_year.to_i + 1
  end
  return adjusted_month, adjusted_year, two_digit_month, year
end

def create_partition(adjusted_month, adjusted_year, pg_connection, two_digit_month, year)
  pg_connection.execute("create table messages_y#{year}m#{two_digit_month} (check (timestamp >= DATE '#{year}-#{two_digit_month}-01' and timestamp < DATE '#{adjusted_year}-#{adjusted_month.to_i+1}-01')) inherits (messages)")
end

def add_new_conditional_to_trigger_function(adjusted_month, adjusted_year, pg_connection, two_digit_month, year)
  trigger_function = pg_connection.execute("select pg_get_functiondef(oid) as def from pg_proc where proname = 'message_insert_trigger'").first["def"]
  insert_new_conditional_at = trigger_function.upcase.index(/ELSE/) - 1
  trigger_function.insert(insert_new_conditional_at, <<-eos
                                                  ELSIF ( NEW.timestamp >= DATE '#{year}-#{two_digit_month}-01' AND NEW.timestamp < DATE '#{adjusted_year}-#{adjusted_month.to_i+1}-01' ) THEN
                                                  INSERT INTO messages_y#{year}m#{two_digit_month} VALUES (NEW.*);
  eos
  )
  trigger_function
end

def create_trigger(pg_connection)
  pg_connection.execute("CREATE TRIGGER insert_message_trigger BEFORE INSERT ON messages FOR EACH ROW EXECUTE PROCEDURE message_insert_trigger()")
end

def autopartition_messages
  pg_connection = ActiveRecord::Base.connection
  partitionables = pg_connection.execute("select distinct(date_part('month',timestamp), date_part('year',timestamp)) as partitionables from staging")
  trigger_function = ""
  partitionables.each do |partitionable|
    adjusted_month, adjusted_year, two_digit_month, year = extract_partition_elements(partitionable)
    partition_exists = pg_connection.execute("select exists (select * from pg_tables where schemaname = 'public' and tablename='messages_y#{year}m#{two_digit_month}')").first["exists"]
    if partition_exists == 'f'
      create_partition(adjusted_month, adjusted_year, pg_connection, two_digit_month, year)
    
      trigger_function_exists = pg_connection.execute("select exists(select pg_get_functiondef(oid) from pg_proc where proname = 'message_insert_trigger')").first["exists"]
      if trigger_function_exists == 't'
        trigger_function = add_new_conditional_to_trigger_function(adjusted_month, adjusted_year, pg_connection, two_digit_month, year)
      else
        #Create new trigger
        trigger_function = <<-eos
                CREATE OR REPLACE FUNCTION message_insert_trigger()
                RETURNS TRIGGER AS $insert_message_trigger$
                BEGIN
                  IF ( NEW.timestamp >= DATE '#{year}-#{two_digit_month}-01' AND NEW.timestamp < DATE '#{adjusted_year}-#{adjusted_month.to_i+1}-01') THEN
                  INSERT INTO messages_y#{year}m#{two_digit_month} VALUES (NEW.*);
                  ELSE
                  RAISE EXCEPTION 'Timestamp: %', NEW.timestamp;
                  --RAISE EXCEPTION 'No matching year-month partition.  Fix the message_insert_trigger() function!';
                  END IF;
                  RETURN NULL;
                END;
                $insert_message_trigger$
                LANGUAGE plpgsql;
        eos
      end
      pg_connection.execute(trigger_function)    
    end
  end
  trigger_exists = pg_connection.execute("select exists (select tgname from pg_trigger where tgname='insert_message_trigger');").first["exists"]
  if trigger_exists == 'f'
    create_trigger(pg_connection)
  end
  pg_connection.execute("set constraint_exclusion = on")
end