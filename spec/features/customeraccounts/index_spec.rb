require 'rails_helper'

RSpec.describe 'show page' do
  it "displays the account attributes" do
    customer = Customer.create!(name: 'Ted', age: 28, active_account: true)
    account1 = Account.create!(acct_name: 'Google', has_money: true, dollar_amount: 5, customer_id: customer.id)
    account2 = Account.create!(acct_name: 'Amazon', has_money: false, dollar_amount: 6, customer_id: customer.id)

    customer2 = Customer.create!(name: 'Jim', age: 29, active_account: false)
    account3 = Account.create!(acct_name: 'Best Buy', has_money: true, dollar_amount: 7, customer_id: customer2.id)
    account4 = Account.create!(acct_name: 'Gamestop', has_money: false, dollar_amount: 8, customer_id: customer2.id)


    visit "/customers/#{customer.id}/accounts"

    expect(page).to have_content(account1.acct_name)
    expect(page).to have_content(account1.has_many)
    expect(page).to have_content(account1.dollar_amount)
    expect(page).to have_content(account2.acct_name)
    expect(page).to have_content(account2.has_many)
    expect(page).to have_content(account2.dollar_amount)

    expect(page).not_to have_content(account3.acct_name)
    expect(page).not_to have_content(account3.has_many)
    expect(page).not_to have_content(account3.dollar_amount)
    expect(page).not_to have_content(account4.acct_name)
    expect(page).not_to have_content(account4.has_many)
    expect(page).not_to have_content(account4.dollar_amount)
  end
end
