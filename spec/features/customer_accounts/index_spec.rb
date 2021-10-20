require 'rails_helper'

RSpec.describe 'customer accounts index page' do
  it "displays the customer's accounts and their attributes" do
    customer = Customer.create!(name: 'Ted',
                                age: 28,
                                active_account: true)
    account1 = Account.create!(acct_name: 'Google',
                               has_money: true,
                               dollar_amount: 5,
                               customer_id: customer.id)
    account2 = Account.create!(acct_name: 'Amazon',
                               has_money: false,
                               dollar_amount: 6,
                               customer_id: customer.id)


    visit "/customers/#{customer.id}/accounts"

    expect(page).to have_content(customer.name)

    within("#customer_accounts-#{account1.id}") do
      expect(page).to have_content("Name: #{account1.acct_name}")
      expect(page).to have_content(account1.has_money)
      expect(page).to have_content(account1.dollar_amount)
    end

    within("#customer_accounts-#{account2.id}") do
      expect(page).to have_content("Name: #{account2.acct_name}")
      expect(page).to have_content(account2.has_money)
      expect(page).to have_content(account2.dollar_amount)
    end
  end

  it 'does not display other customer accounts and their attributes' do
    customer = Customer.create!(name: 'Ted',
                                age: 28,
                                active_account: true)
    customer2 = Customer.create!(name: 'Jim',
                                 age: 29,
                                 active_account: false)
    account3 = Account.create!(acct_name: 'Best Buy',
                               has_money: true,
                               dollar_amount: 7,
                               customer_id: customer2.id)
    account4 = Account.create!(acct_name: 'Gamestop',
                               has_money: false,
                               dollar_amount: 8,
                               customer_id: customer2.id)

    visit "/customers/#{customer.id}/accounts"

    expect(page).not_to have_content(account3.acct_name)
    expect(page).not_to have_content(account3.has_money)
    expect(page).not_to have_content(account3.dollar_amount)
    expect(page).not_to have_content(account4.acct_name)
    expect(page).not_to have_content(account4.has_money)
    expect(page).not_to have_content(account4.dollar_amount)
  end

  it "has a link to the accounts index page" do
    customer = Customer.create!(name: 'Ted',
                                age: 28,
                                active_account: true)
    visit "/customers/#{customer.id}/accounts"

    click_on "Accounts"

    expect(current_path).to eq('/accounts')
  end

  it "has a link to the customers index page" do
    customer = Customer.create!(name: 'Ted',
                                age: 28,
                                active_account: true)
    visit "/customers/#{customer.id}/accounts"

    click_on "Customers"

    expect(current_path).to eq('/customers')
  end

  it "has a link to create a new customer account" do
    customer = Customer.create!(name: 'Ted',
                                age: 28,
                                active_account: true)

    visit "/customers/#{customer.id}/accounts"

    click_on "Create Account"

    expect(current_path).to eq("/customers/#{customer.id}/accounts/new")

    fill_in :acct_name, with: 'Target'
    fill_in :dollar_amount, with: 24

    choose('has_money', option: 'yes')

    click_on "Create Account"

    expect(current_path).to eq("/customers/#{customer.id}/accounts")

    expect(page).to have_content('Target')
    expect(page).to have_content(24)
    expect(page).to have_content('true')
  end

  it "has a link that sorts the accounts by the alphabet" do
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

    visit "/customers/#{customer.id}/accounts"

    click_on 'Alphabetize'

    expect(current_path).to eq("/customers/#{customer.id}/accounts")

    expect(account2.acct_name).to appear_before(account.acct_name)
    expect(account2.acct_name).to appear_before(account3.acct_name)
  end

  it "returns accounts with more than 3000 dollars" do
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

      visit "/customers/#{customer.id}/accounts"

      fill_in :dollar_amount, with: 3000

      click_on "Only return records with more than 3000 dollars"

      expect(page).not_to have_content(account.acct_name)
      expect(page).not_to have_content(account.has_money)
      expect(page).not_to have_content(account.dollar_amount)

      expect(page).to have_content(account2.acct_name)
      expect(page).to have_content(account2.has_money)
      expect(page).to have_content(account2.dollar_amount)

      expect(page).to have_content(account3.acct_name)
      expect(page).to have_content(account3.has_money)
      expect(page).to have_content(account3.dollar_amount)
  end
end
