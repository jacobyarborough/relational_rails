class ChannelSubscribersController < ApplicationController
    def index 
        channel = Channel.find(params[:channel_id])
        @subscribers = channel.subscribers
    end 
end 