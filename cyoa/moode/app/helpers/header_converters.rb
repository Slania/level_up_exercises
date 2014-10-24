require 'csv'

CSV::HeaderConverters[:users_converter] = lambda do |header|
  case header.downcase
  when "id"
    "slack_id"
  when "name"
    "username"
  when "real_name"
    "real_name"
  when "email"
    "email"
  when "image_192"
    "avatar_url"
  else
  	raise RuntimeError, "Unknown field in User CSV"
  end
end

CSV::HeaderConverters[:channels_history_converter] = lambda do |header|
  case header.downcase
  when "type"
    "type"
  when "ts"
    "ts"
  when "text"
    "text"
  when "user"
    "user"
  else
  	raise RuntimeError, "Unknown field in User CSV"
  end
end

CSV::HeaderConverters[:channels_list_converter] = lambda do |header|
  case header.downcase
  when "id"
    "slack_id"
  when "name"
    "name"
  else
  	raise RuntimeError, "Unknown field in User CSV"
  end
end
