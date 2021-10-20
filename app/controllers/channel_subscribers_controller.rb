class ChannelSubscribersController < ApplicationController
    def index 
        channel = Channel.find(params[:channel_id])
        @subscribers = channel.index_view(params)
    end 

    def new
    end 

    def create
        subscriber = Subscriber.create(subscriber_params)
        subscriber.save
        redirect_to "/channels/#{params[:channel_id]}/subscribers"
    end 

    private
    def subscriber_params
        subscriber_params = params.permit(:name, :age, :top_market)
        subscriber_params[:channel_id] = params[:channel_id]
        subscriber_params[:age] = subscriber_params[:age].to_i
        if subscriber_params[:top_market] == 'yes'
            subscriber_params[:top_market] = true
        else
            subscriber_params[:top_market] = false
        end 
        subscriber_params
    end 
end 