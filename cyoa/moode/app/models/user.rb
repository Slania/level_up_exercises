require_relative '../service/fetching_service'
require_relative '../helpers/header_converters'

class User < ActiveRecord::Base

  ENOVA_KEY = "xoxp-2152171150-2514507291-2644555553-c6986f"

  def self.registered_users
    registered_users = []
    find_each(batch_size: 1000) { |user| registered_users << {id: user[:id], slack_id: user[:slack_id]} }

    registered_users
  end

  def self.update_from_slack
    users_table = SlackFront.new(ENOVA_KEY).users_list(exclusion_list: {exclude_on: "id", exclude: registered_users.map { |user| user[:slack_id] }}).table
  
    users = CSV.new(users_table.to_csv, headers: true, header_converters: [:users_converter])
    ActiveRecord::Base.transaction do
      users.to_a.each { |user| User.create(user.to_hash) }  
    end
  end

end
