class Customer < ApplicationRecord
  validates :age, numericality: true
  has_many :accounts

  def self.recently_created
    order(created_at: :desc)
  end

  def count_accounts
    accounts.count
  end
end
