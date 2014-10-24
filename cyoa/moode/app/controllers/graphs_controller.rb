class GraphsController < ApplicationController

  def show
    @channels = Channel.registered_channels.map { |channel| {id: channel[:id], name: channel[:name]} }
  end

end