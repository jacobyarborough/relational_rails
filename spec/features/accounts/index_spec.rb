require 'rails_helper'

RSpec.describe 'index page' do
  it "shows the account attributes" do
    customer = Customer.create!(name: 'Ted', age: 28, active_account: true)

    account = Account.create!(acct_name: 'Bob', has_money: true, dollar_amount: 2400, customer_id: customer.id)
    account2 = Account.create!(acct_name: 'Joe', has_money: false, dollar_amount: 3400, customer_id: customer.id)

    visit '/accounts'

    expect(page).to have_content(account.acct_name)
    expect(page).to have_content(account.has_money)
    expect(page).to have_content(account.dollar_amount)

    expect(page).to have_content(account2.acct_name)
    expect(page).to have_content(account2.has_money)
    expect(page).to have_content(account2.dollar_amount)
  end
end
