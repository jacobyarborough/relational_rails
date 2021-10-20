require 'rails_helper'

RSpec.describe 'show page' do
  it "shows the account's attributes" do
    customer = Customer.create!(name: 'Ted',
                                age: 28,
                                active_account: true)

    account = Account.create!(acct_name: 'Bob',
                              has_money: true,
                              dollar_amount: 2400,
                              customer_id: customer.id)

    customer2 = Customer.create!(name: 'Dudarino',
                                 age: 40,
                                 active_account: false)
    account2 = Account.create!(acct_name: 'Joe',
                               has_money: false,
                               dollar_amount: 3400,
                               customer_id: customer2.id)

    visit "/accounts/#{account.id}"

    expect(page).to have_content(account.acct_name)
    expect(page).to have_content(account.has_money)
    expect(page).to have_content(account.dollar_amount)

    expect(page).not_to have_content(account2.acct_name)
    expect(page).not_to have_content(account2.has_money)
    expect(page).not_to have_content(account2.dollar_amount)
  end

  it "has a link to the accounts index page" do
    customer = Customer.create!(name: 'Ted',
                                age: 28,
                                active_account: true)
    account = Account.create!(acct_name: 'Bob',
                              has_money: true,
                              dollar_amount: 2400,
                              customer_id: customer.id)

    visit "/accounts/#{account.id}"

    click_on "Accounts"

    expect(current_path).to eq("/accounts")
  end

  it "has a link to the customers index page" do
    customer = Customer.create!(name: 'Ted',
                                age: 28,
                                active_account: true)
    account = Account.create!(acct_name: 'Bob',
                              has_money: true,
                              dollar_amount: 2400,
                              customer_id: customer.id)

    visit "/accounts/#{account.id}"

    click_on "Customers"

    expect(current_path).to eq("/customers")
  end

  it "has a link that can update an Account" do
    customer = Customer.create!(name: 'Ted',
                                age: 28,
                                active_account: true)
    account = Account.create!(acct_name: 'Bob',
                              has_money: true,
                              dollar_amount: 2400,
                              customer_id: customer.id)
    visit "/accounts/#{account.id}"

    click_on 'Update Account'

    expect(current_path).to eq("/accounts/#{account.id}/edit")

    fill_in :acct_name, with: 'Dude'
    fill_in :dollar_amount, with: 42

    choose('has_money', option: 'yes')

    click_on 'Update Account'
    expect(current_path).to eq("/accounts/#{account.id}")

    expect(page).to have_content('Dude')
    expect(page).to have_content(42)
    expect(page).to have_content(true)
  end
end
