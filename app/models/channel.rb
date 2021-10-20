class Channel < ApplicationRecord
    has_many :subscribers

    def sub_count
        subscribers.length
    end 

    def self.recently_created
        order(created_at: :desc)
    end 

    def index_view(params)
        channel = Channel.find(params[:channel_id])
        if params["minimum_age_of_subscribers"]
            min_age = params["minimum_age_of_subscribers"]
            channel.subscribers.where("age > #{min_age}")
        else 
            channel.subscribers
        end 
    end
end 