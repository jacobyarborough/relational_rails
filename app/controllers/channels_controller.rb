class ChannelsController < ApplicationController
    def index 
        @channels = ['CBS', 'NBC', 'ABC']
    end 

    def new 
    end 
end 