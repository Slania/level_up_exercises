require 'json'
require 'pry'

class MessagesController < ApplicationController
  MINUTES_PER_DAY = 1440
  MAX_NUMBER_OF_BUCKETS = 50
  BUFFER_BUCKETS = 1
  MINUTES_PER_HOUR = 60.0

  before_filter :defaults
  respond_to :json

  def instantaneous_data
    instantaneous_scores = ActiveRecord::Base.connection.execute(
      query(score_select: "sum(messages.score) as score", count_select: "count(*) as count", 
            channel_select: @channel_select, optional_where_clauses: @channel_where_clause)
    )

    instantaneous_scores.inject(@channel_scores) do |data, datapoint|
      data[datapoint["name"]] ||= {}
      data[datapoint["name"]]["mood_data"] ||= []

      data[datapoint["name"]]["count_data"] ||= []
      data[datapoint["name"]]["mood_data"] << [BigDecimal(datapoint["ts"]).truncate, Float(datapoint["score"])]
      data[datapoint["name"]]["count_data"] << [BigDecimal(datapoint["ts"]).truncate, Integer(datapoint["count"])]
      data
    end

    bucketed_messages = message_sample_data(channel_select: @channel_select, optional_where_clauses: @channel_where_clause)
    bucketed_messages.inject(@channel_scores) do |data, datapoint|
      data[datapoint["name"]] ||= {}
      data[datapoint["name"]]["message_data"] ||= {}
      data[datapoint["name"]]["message_data"][datapoint["ts"]] ||= []
      data[datapoint["name"]]["message_data"][datapoint["ts"]] << datapoint["text"]
      data
    end

    respond_with JSON.generate(@channel_scores)
  end

  def cumulative_data
    score_select_query = @channel_select ? "sum(avg(messages.score)) over (partition by channels.name order by i.start_time) as score" \
                                         : "sum(avg(messages.score)) over (order by i.start_time) as score"

    cumulative_scores = ActiveRecord::Base.connection.execute(
      query(score_select: score_select_query, channel_select: @channel_select, optional_where_clauses: @channel_where_clause)
    )

    cumulative_scores.inject(@channel_scores) do |data, datapoint|
      data[datapoint["name"]] ||= {}
      data[datapoint["name"]]["mood_data"] ||= []
      data[datapoint["name"]]["mood_data"] << [BigDecimal(datapoint["ts"]).truncate, Float(datapoint["score"])]
      data
    end

    respond_with JSON.generate(@channel_scores)
  end

  def message_sample_data(channel_select: nil, optional_where_clauses: nil)
    sql = <<-END_SQL
    with intervals as (
      select 
        (select #{ActiveRecord::Base.sanitize(params[:startDate])}::date) + (n      || ' minutes')::interval start_time,
        (select #{ActiveRecord::Base.sanitize(params[:startDate])}::date) + ((n+60) || ' minutes')::interval end_time
          from generate_series(0, (24*60*#{@days}), 60 * #{@increment_hours}) n
    ), intervaled_messages as (
      select
        extract(epoch from i.start_time)::numeric * 1000 as ts, 
        extract(epoch from i.end_time)::numeric * 1000 as end_ts,
        abs(score - avg(score) over (partition by i.start_time)) as deviation,
        text
        #{",#{channel_select}" if channel_select}
      from messages
      right join intervals i
        on messages.timestamp >= i.start_time and messages.timestamp < i.end_time
      #{"join channels on messages.channel_id = channels.id" if channel_select}
      where messages.timestamp between '09/29/2014' and '10/06/2014'
      #{optional_where_clauses}
    ), ranked_messages as (
      select ts, end_ts, deviation, text,
        rank() over (partition by ts order by deviation) as rank,
        row_number() over (partition by ts order by deviation) as row_number
        #{",#{channel_select}" if channel_select}
      from intervaled_messages
    )
    select ts, end_ts, deviation, rank, text #{",#{channel_select}" if channel_select}
    from ranked_messages 
    where rank between 1 and 5
      and row_number between 1 and 5
    order by ts;
    END_SQL

    bucketed_messages = ActiveRecord::Base.connection.execute(sql)
    bucketed_messages
  end

  protected
  def defaults
    if params["startDate"].empty? || params["endDate"].empty?
      params["startDate"] = (Date.today - 7).strftime('%m/%d/%Y')
      params["endDate"] = Date.today.strftime('%m/%d/%Y')
    end

    @days = Integer(Date.strptime(params["endDate"], '%m/%d/%Y') - Date.strptime(params["startDate"], '%m/%d/%Y'))
    #cap number of buckets to 50
    @increment_hours = ((((@days * MINUTES_PER_DAY) / MAX_NUMBER_OF_BUCKETS) + BUFFER_BUCKETS) / MINUTES_PER_HOUR).ceil
    @channel_where_clause = params["channels"].empty? ? nil : "and channel_id in (#{params["channels"]})"
    @channel_select = @channel_where_clause ? "name" : nil
    @channel_scores = {}
    @channel_messages = {}
  end

  def query(score_select: nil, count_select: nil, channel_select: nil, optional_where_clauses: nil)
    <<-END_SQL
      with intervals as (
      select 
        (select #{ActiveRecord::Base.sanitize(params[:startDate])}::date) + (n      || ' minutes')::interval start_time,
        (select #{ActiveRecord::Base.sanitize(params[:startDate])}::date) + ((n+60) || ' minutes')::interval end_time
          from generate_series(0, (24*60*#{@days}), 60 * #{@increment_hours}) n
      )
      select 
        extract(epoch from i.start_time)::numeric * 1000 as ts, 
        extract(epoch from i.end_time)::numeric * 1000 as end_ts,
        #{score_select}
        #{",#{count_select}" if count_select}
        #{",#{channel_select}" if channel_select}
      from messages
      right join intervals i
        on messages.timestamp >= i.start_time and messages.timestamp < i.end_time
      #{"join channels on messages.channel_id = channels.id" if channel_select}
      where messages.timestamp between #{ActiveRecord::Base.sanitize(params[:startDate])} and #{ActiveRecord::Base.sanitize(params[:endDate])}
      #{optional_where_clauses}
      group by i.start_time, i.end_time #{", #{channel_select}" if channel_select}
      order by i.start_time
    END_SQL
  end
end