class Account < ApplicationRecord
  belongs_to :customer

  def self.alphabetize
    order(:acct_name)
  end

  def self.only_has_money
    where(has_money: true)
  end

  def self.dollar_amount_threshold(amount)
    where("dollar_amount > ?", amount )
  end
end
