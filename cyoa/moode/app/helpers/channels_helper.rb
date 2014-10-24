module ChannelsHelper
  def channel_names(channels_list)
    channels_list.map { |channel| channel[:name] }
  end
end