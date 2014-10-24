require 'slack'
require 'csv'
require 'active_support/all'
require 'pry'

class SlackFront
  attr_accessor :table, :fetch_table

  CHANNELS_HISTORY_SETTINGS = {batch_size: 1000, keys: ["type", "user", "text", "ts"], exclusion_list: {exclude_on: nil, exclude: []}}
  CHANNELS_LIST_SETTINGS = {keys: ["id", "name"], exclusion_list: {exclude_on: nil, exclude: []}}
  USERS_LIST_SETTINGS = {keys: ["id", "name", "real_name", "email", "image_192"], exclusion_list: {exclude_on: nil, exclude: []}}

  def initialize(token)
    @token = token
    @fetch_table = {}
    Slack.configure { |config| config.token = token }
  end

  def channels_history(channel_slack_id: nil, max: 1000, oldest: nil, project: CHANNELS_HISTORY_SETTINGS[:keys], exclusion_list: CHANNELS_HISTORY_SETTINGS[:exclusion_list])
    @information = fetch("messages", project, Proc.new { |*args| slack_channels_history(*args) }, exclusion_list, channel_slack_id, oldest)
    max -= @information["messages"].size
    @fetch_table[channel_slack_id.intern] ||= {} and @fetch_table[channel_slack_id.intern][:fetched] ||= 0
    @fetch_table[channel_slack_id.intern][:fetched] += @information["messages"].size

    channels_history(channel_slack_id: channel_slack_id, max: max, 
                    oldest: @information["messages"].first["ts"], project: project) if @information["has_more"] && max > 0
    @fetch_table[channel_slack_id.intern][:has_more] ||= true if @information["has_more"] && max <= 0
    self
  end

  def channels_list(project: CHANNELS_LIST_SETTINGS[:keys], exclusion_list: CHANNELS_LIST_SETTINGS[:exclusion_list])
    @information = fetch("channels", project, Proc.new { slack_channels_list }, exclusion_list) 
    self
  end

  def users_list(project: USERS_LIST_SETTINGS[:keys], exclusion_list: USERS_LIST_SETTINGS[:exclusion_list])
    @information = fetch("members", project, Proc.new { slack_users_list }, exclusion_list)
    self
  end
  
  def fetch(data_element, projection, slack_call, exclusion_list = {}, *args)
    information = slack_call.call(*args)

    if information["ok"]
      data_keys = projection || information[data_element].first.keys
      @table ||= CSV::Table.new([CSV::Row.new(data_keys,[],true)])

      tabulate(data_keys, information[data_element], table, exclusion_list)
    else
    	raise RuntimeError, "Slack API failure"
    end
    information
  end

  private

  def tabulate(keys, data, table, exclusion_list)
    data.each do |datum|
      row = CSV::Row.new(flatten(datum).slice(*keys).keys, flatten(datum).slice(*keys).values, false)
      @table << row.fields(*keys) unless exclusion_list[:exclude].include?(row.field(exclusion_list[:exclude_on]))
    end
  end

  def slack_users_list
    Slack.client.users_list
  end

  def slack_channels_history(channel_slack_id, oldest_ts)
    Slack.client.channels_history({channel: channel_slack_id,
                                   oldest: oldest_ts, count: CHANNELS_HISTORY_SETTINGS[:batch_size]})
  end

  def slack_channels_list
    Slack.client.channels_list
  end

  def slack_auth_test
    Slack.client.auth_test
  end

  def flatten(data, key = "", flattened_data = {})
    return flattened_data.merge!({key => data}) unless data.is_a? Hash
    data.each { |k,v| flatten(v, k, flattened_data) }
    flattened_data
  end

end
