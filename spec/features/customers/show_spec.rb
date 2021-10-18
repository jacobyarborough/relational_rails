require 'rails_helper'

RSpec.describe 'show page' do
  it "displays the account attributes" do
    customer = Customer.create!(name: 'Ted',
                                age: 28,
                                active_account: true)

    customer2 = Customer.create!(name: 'Jim',
                                 age: 29,
                                 active_account: false)

    visit "/customers/#{customer.id}"

    expect(page).to have_content("Name: #{customer.name}")
    expect(page).to have_content("Active Account: #{customer.active_account}")
    expect(page).to have_content("Age: #{customer.age}")

    expect(page).not_to have_content("Name: #{customer2.name}")
    expect(page).not_to have_content("Active Account: #{customer2.active_account}")
    expect(page).not_to have_content("Age: #{customer2.age}")
  end

  it "can count the number of accounts associated to a customer" do

    customer = Customer.create!(name: 'Ted',
                                age: 28,
                                active_account: true)
    customer.accounts.create!(acct_name: 'Google',
                              has_money: true,
                              dollar_amount: 20)
    customer.accounts.create!(acct_name: 'Amazon',
                              has_money: false,
                              dollar_amount: 30)

    visit "/customers/#{customer.id}"

    expect(page).to have_content("Number of Accounts: #{customer.count_accounts}")
  end
end
