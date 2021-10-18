require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe "relationships" do
    it {should have_many :accounts}
  end

  describe "class methods" do
    describe '#recently_created' do
      it "orders the customers by recently created first" do
        customer = Customer.create!(name: 'Ted',
                                    age: 28,
                                    active_account: true,
                                    created_at: '05/20/2021')
        customer2 = Customer.create!(name: 'Jim',
                                     age: 29,
                                     active_account: false,
                                     created_at: '05/30/2021')

        expect(Customer.recently_created).to eq([customer2, customer])
      end
    end
  end
end
