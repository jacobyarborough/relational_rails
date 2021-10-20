require 'rails_helper'

RSpec.describe Account, type: :model do
  describe "relationships" do
    it {should belong_to :customer}
  end

  describe "class methods" do
    describe "#alphabetize" do
      it "can sort the accounts alphabetically" do
        customer = Customer.create!(name: 'Ted',
                                    age: 28,
                                    active_account: true)

        account = Account.create!(acct_name: 'Zoe',
                                  has_money: true,
                                  dollar_amount: 2400,
                                  customer_id: customer.id)

        account2 = Account.create!(acct_name: 'Joe',
                                   has_money: false,
                                   dollar_amount: 3400,
                                   customer_id: customer.id)

        account3 = Account.create!(acct_name: 'Karl',
                                   has_money: false,
                                   dollar_amount: 3500,
                                   customer_id: customer.id)

        expect(Account.alphabetize).to eq([account2, account3, account])
      end
    end
  end
end
