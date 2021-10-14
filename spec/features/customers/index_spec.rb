require 'rails_helper'
# [ ] done
#
# User Story 1, Parent Index (x2)
#
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

RSpec.describe "index page" do
  it "shows the name of each parent record in the system" do
    customer = Customer.create!(name: 'Ted', age: 28, active_account: true)
    customer2 = Customer.create!(name: 'Jim', age: 29, active_account: false)

    visit '/customers'

    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer2.name)
  end
end