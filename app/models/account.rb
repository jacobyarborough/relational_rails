class Account < ApplicationRecord
  belongs_to :customer

  def self.alphabetize
    order(:acct_name)
  end

  def self.only_has_money
    where(has_money: true)
  end
end
