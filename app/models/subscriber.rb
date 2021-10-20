class Subscriber < ApplicationRecord
    belongs_to :channel

    def self.get_true
        where(top_market: true)
    end 

    def self.index_view(params)
        if params["alpha_sort"]
            subscribers = Subscriber.get_true
            subscribers.order(name: :asc)
        else 
            Subscriber.get_true
        end
    end 
end 