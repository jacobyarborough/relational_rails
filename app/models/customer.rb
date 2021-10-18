class Customer < ApplicationRecord
  has_many :accounts

  def self.recently_created
    order(created_at: :desc)
  end
end
