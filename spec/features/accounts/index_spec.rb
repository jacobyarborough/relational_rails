require 'rails_helper'

RSpec.describe 'index page' do
  it "shows the account attributes" do
    customer = Customer.create!(name: 'Ted',
                                age: 28,
                                active_account: true)

    account = Account.create!(acct_name: 'Zoe',
                              has_money: true,
                              dollar_amount: 2400,
                              customer_id: customer.id)

    account2 = Account.create!(acct_name: 'Joe',
                               has_money: true,
                               dollar_amount: 3400,
                               customer_id: customer.id)

    visit '/accounts'

    expect(page).to have_content(account.acct_name)
    expect(page).to have_content(account.has_money)
    expect(page).to have_content(account.dollar_amount)

    expect(page).to have_content(account2.acct_name)
    expect(page).to have_content(account2.has_money)
    expect(page).to have_content(account2.dollar_amount)
  end

  it "has a link to the accounts index page" do

    visit "/accounts"

    click_on "Accounts"

    expect(current_path).to eq("/accounts")
  end

  it "has a link to the customers index page" do

    visit "/accounts"

    click_on "Customers"

    expect(current_path).to eq("/customers")
  end

  it "only shows accounts that have money" do

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
    visit "/accounts"

    expect(page).to have_content(account.acct_name)
    expect(page).to have_content(account.has_money)
    expect(page).to have_content(account.dollar_amount)

    expect(page).not_to have_content(account2.acct_name)
    expect(page).not_to have_content(account2.has_money)
    expect(page).not_to have_content(account2.dollar_amount)

    expect(page).not_to have_content(account3.acct_name)
    expect(page).not_to have_content(account3.has_money)
    expect(page).not_to have_content(account3.dollar_amount)


  end
end
