require_relative '../helpers/header_converters'
require_relative '../service/fetching_service'
require_relative '../service/scoring_service'
require 'pry'

class NewUserException < Exception ; end

class Message < ActiveRecord::Base

  ENOVA_KEY = "xoxp-2152171150-2514507291-2644555553-c6986f"

  belongs_to :user
  belongs_to :channel

  def self.messages_from_slack(channel_id, channel_slack_id, oldest = nil)
    @users ||= User.registered_users
    @slack_front = SlackFront.new(ENOVA_KEY)
    message_table = @slack_front.channels_history(channel_slack_id: channel_slack_id, oldest: oldest).table

    score_and_associate(message_table, channel_id)
  end

  def self.update_channels(channel_slack_ids)
    update_list = []
    @write_headers = true
    fetch_table = {}

    channels = Channel.where(slack_id: channel_slack_ids)
    channel_ids = channels.map { |channel| channel[:id] }

    #channels_with_data
    Message.where(channel_id: channel_ids).group(:channel_id).maximum(:ts).each do |channel_id, max_ts_fetched|
      update_list << {id: channel_id, ts: max_ts_fetched, slack_id: (channels.select { |channel| channel[:id].eql? channel_id }).first[:slack_id]}
    end

    #channels_with_no_data, ts:1 forces it to start as far back as possible (creation)
    (channel_ids.reject { |id| (update_list.map { |update_info| update_info[:id] }).include? id }).each do |silent_channel_id|
      update_list << {id: silent_channel_id, ts: 1, slack_id: (channels.select { |channel| channel[:id].eql? silent_channel_id }).first[:slack_id]}
    end    

    @tempfile = Tempfile.new('messages')
    update_list.each do |channel|
      puts "Doing channel: #{channel[:slack_id]}"
      save!(@tempfile, CSV.new(messages_from_slack(channel[:id], channel[:slack_id], channel[:ts]).to_csv,
           headers: true, header_converters: [:channels_history_converter]))
      @slack_front.fetch_table.each do |channel, info| 
        puts "Channel: #{channel}, Fetched: #{info[:fetched]}, Has_More: #{info[:has_more]}"
        fetch_table.merge!({channel => {fetched: info[:fetched], has_more: info[:has_more]}})
      end
    end
  rescue Exception => e
    puts "Error: #{e}, Backtrace: #{e.backtrace}"
  ensure
    puts @tempfile.path
    @tempfile.close
    return {file: @tempfile, fetch_table: fetch_table}
  end

  def self.update_all_channels
    channel_ids = Channel.registered_channels.map { |channel| channel[:slack_id] }

    update_channels(channel_ids)
  end

  private

  def self.score_and_associate(messages, channel_id)
    analyzer = Sentimentalizer.new
    begin
      @retries ||= 3
      messages.each_with_index do |message, index|
        next if index.zero?
        #should only be one user as user_slack_id is unique
        users = @users.select { |user| user[:slack_id].eql? message["user"] }
        raise NewUserException if (users.empty? && !@retries.zero?)
        message << {score: analyzer.score(message["text"]).first, 
                    user_id: users.first ? users.first[:id] : nil,
                    channel_id: channel_id} \
                    unless message[:score] || message[:user_id] || message[:channel_id]
      end
      messages.delete("user")
      messages
    rescue NewUserException => e
      User.update_from_slack
      @users = User.registered_users
      retry unless (@retries -= 1) < 0
    end
  end

  def self.save!(file, messages)
    begin
      return if messages.to_a.empty?
      messages.rewind
      headers = ""
      messages.to_a.each do |row|
        headers = messages.headers
      end
      headers << ["score", "user_id", "channel_id"]
      if @write_headers
        file.puts(headers.join(','))
        @write_headers = false 
      end
      messages.rewind
      messages.to_a.each do |row|
        file.write(row)
      end
      puts file.path
    ensure
      #file.close
      #file.unlink
    end
  end

end
