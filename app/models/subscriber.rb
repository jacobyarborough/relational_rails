class Subscriber < ApplicationRecord
    belongs_to :channel

    def self.get_true
        where(top_market: true)
    end 
end 