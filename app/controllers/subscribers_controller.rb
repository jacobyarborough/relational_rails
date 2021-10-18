class SubscribersController < ApplicationController
    def index 
        @subscribers = Subscriber.all
    end 

    def show 
        @subscriber = Subscriber.find(params[:id])
    end 
end 