class Channel < ApplicationRecord
    has_many :subscribers

    def sub_count
        self.subscribers.length
    end 
end 