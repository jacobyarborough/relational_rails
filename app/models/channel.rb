class Channel < ApplicationRecord
    has_many :subscribers

    def sub_count
        subscribers.length
    end 

    def self.recently_created
        order(created_at: :desc)
    end 
end 