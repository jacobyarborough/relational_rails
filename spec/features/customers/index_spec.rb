require 'rails_helper'

RSpec.describe "index page" do
  it "shows the name of each parent record in the system" do
    customer = Customer.create!(name: 'Ted',
                                age: 28,
                                active_account: true)
    customer2 = Customer.create!(name: 'Jim',
                                 age: 29,
                                 active_account: false)

    visit '/customers'

    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer2.name)
  end

  it "shows the customers sorted by most recently created" do

    customer = Customer.create!(name: 'Ted',
                                age: 28,
                                active_account: true)
    customer2 = Customer.create!(name: 'Jim',
                                 age: 29,
                                 active_account: false)

    visit '/customers'

    expect(customer2.name).to appear_before(customer.name)

  end

  it "has a link to the accounts index page" do
    visit '/customers'

    click_on "Accounts"

    expect(current_path).to eq('/accounts')
  end

  it "has a link to the customers index page" do
    visit '/customers'

    click_on "Customers"

    expect(current_path).to eq('/customers')
  end

  it 'should have a link to create a new customer' do
        visit "/customers"

        click_link "New Customer"

        expect(current_path).to eq('/customers/new')

        fill_in :name, with: 'tedaroosky'
        fill_in :age, with: 12

        choose('account_active', option: 'yes')

        click_on "Create Customer"

        expect(current_path).to eq('/customers')
        expect(page).to have_content('tedaroosky')
    end

  it "has a link to update the customer" do
    customer = Customer.create!(name: 'Ted',
                                age: 28,
                                active_account: true)
    visit "/customers/"

    click_on 'Update Customer'

    expect(current_path).to eq("/customers/#{customer.id}/edit")
  end
end
