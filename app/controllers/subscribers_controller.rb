class SubscribersController < ApplicationController
    def index 
        @subscribers = Subscriber.index_view(params)
    end 

    def show 
        @subscriber = Subscriber.find(params[:id])
    end 

    def edit 
        @subscriber = Subscriber.find(params[:id])
    end

    def update 
        subscriber = Subscriber.find(params[:id])
        subscriber.update(subscriber_params)
        subscriber.save
        redirect_to "/subscribers/#{params[:id]}"
    end 

    def destroy 
        Subscriber.destroy(params[:id])
        redirect_to '/subscribers'
    end 

    private
    def subscriber_params
        subscriber_params = params.permit(:name, :age, :top_market)
        subscriber_params[:age] = subscriber_params[:age].to_i
        if subscriber_params[:top_market] == 'yes'
            subscriber_params[:top_market] = true
        else
            subscriber_params[:top_market] = false
        end 
        subscriber_params
    end 
end 