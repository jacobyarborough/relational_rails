class ChannelsController < ApplicationController
    def index 
        @channels = Channel.all
    end 

    def show
        @channel = Channel.find(params[:id])
    end 

    def new 
    end 

    def create 
        Channel.create(channel_params)
        redirect_to '/channels'
    end 

    def edit
        @channel = Channel.find(params[:id])
    end

    def update
        channel = Channel.find(params[:id])
        channel.update(channel_params)
        channel.save
        redirect_to "/channels/#{channel.id}"
    end 

    private
    def channel_params
        channel_params = params.permit(:name, :cost, :spanish)
        channel_params[:cost] = channel_params[:cost].to_i
        if channel_params[:spanish] == 'yes'
            channel_params[:spanish] = true
        else
            channel_params[:spanish] = false
        end 
        channel_params
    end 
end 