require 'rails_helper'


# User Story 2, Parent Show (x2)
#
# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table
RSpec.describe 'show page' do
  it "displays the account attributes" do
    customer = Customer.create!(name: 'Ted', age: 28, active_account: true)

    customer2 = Customer.create!(name: 'Jim', age: 29, active_account: false)

    visit "/customers/#{customer.id}"

    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.active_account)
    expect(page).to have_content(customer.age)

    expect(page).not_to have_content(customer2.name)
    expect(page).not_to have_content(customer2.active_account)
    expect(page).not_to have_content(customer2.age)
  end
end
