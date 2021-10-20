class Account < ApplicationRecord
  belongs_to :customer

  def self.alphabetize
    order(:acct_name)
  end
end
