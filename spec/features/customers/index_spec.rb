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
#     [ ] done
#
# User Story 6, Parent Index sorted by Most Recently Created (x2)
#
# As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created
  
    customer = Customer.create!(name: 'Ted',
                                age: 28,
                                active_account: true)
    customer2 = Customer.create!(name: 'Jim',
                                 age: 29,
                                 active_account: false)

    visit '/customers'

    expect(customer2.name).to appear_before(customer.name)

  end
end
