require_relative '../helpers/header_converters'
require_relative '../service/fetching_service'

class Channel < ActiveRecord::Base

  ENOVA_KEY = "xoxp-2152171150-2514507291-2644555553-c6986f"

  def self.registered_channels
    registered_channels = []
    find_each(batch_size: 1000) { |channel| registered_channels << {id: channel[:id], slack_id: channel[:slack_id], name: channel[:name]} }

    registered_channels
  end

  def self.update_from_slack
    channels_table = SlackFront.new(ENOVA_KEY).channels_list(exclusion_list: {exclude_on: "id", exclude: registered_channels.map { |channel| channel[:slack_id] }}).table
  
    channels = CSV.new(channels_table.to_csv, headers: true, header_converters: [:channels_list_converter])
    ActiveRecord::Base.transaction do
      channels.to_a.each { |channel| Channel.create(channel.to_hash) }  
    end
  end

end