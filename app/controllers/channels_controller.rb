class ChannelsController < ApplicationController
    def index 
        @channels = ['CBS', 'NBC', 'ABC']
    end 

    def new 
    end 

    def create
        channel = Channel.new({
            name: params[:channel][:name],
            price: params[:channel][:price],
            spanish: params[:channel][:spanish]
        })

        channel.save

        redirect_to '/channels'
    end 
end 