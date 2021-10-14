require 'rails_helper'

RSpec.describe 'show page' do
  it "displays the account attributes" do
    customer = Customer.create!(name: 'Ted', age: 28, active_account: true)

    account1 = Account.create!(acct_name: 'Google', has_money: true, dollar_amount: 5, customer_id: customer.id)
    account2 = Account.create!(acct_name: 'Amazon', has_money: false, dollar_amount: 6, customer_id: customer.id)


    visit "/accounts/#{account1.id}"

    expect(page).to have_content(account1.acct_name)
    expect(page).to have_content(account1.has_many)
    expect(page).to have_content(account1.dollar_amount)
    expect(page).not_to have_content(account2.acct_name)
    expect(page).not_to have_content(account2.has_many)
    expect(page).not_to have_content(account2.dollar_amount)
  end
end
