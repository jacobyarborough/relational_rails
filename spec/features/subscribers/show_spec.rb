require 'rails_helper'

RSpec.describe 'the subscribers show page' do
    it 'shows the subscriber and attributes' do
        channel_1 = Channel.create(name: 'ABC', cost: 25, spanish: false)
        channel_2 = Channel.create(name: 'CBS', cost: 20, spanish: true)
        sub_1 = Subscriber.create(name: 'Jacob', age: 25, top_market: false, channel_id: channel_1.id)
        sub_2 = Subscriber.create(name: 'John', age: 20, top_market: true, channel_id: channel_2.id)

        visit "/subscribers/#{sub_1.id}"
        expect(current_path).to eq("/subscribers/#{sub_1.id}")
        expect(page).to have_content(sub_1.name)
        expect(page).to have_content(sub_1.age)
        expect(page).to have_content(sub_1.top_market)
        expect(page).to_not have_content(sub_2.name)
        expect(page).to_not have_content(sub_2.age)
        expect(page).to_not have_content(sub_2.top_market)
    end 

    it 'has a link to update a subscriber' do 
        channel_1 = Channel.create(name: 'ABC', cost: 25, spanish: false)
        channel_2 = Channel.create(name: 'CBS', cost: 20, spanish: true)
        sub_1 = Subscriber.create(name: 'Jacob', age: 25, top_market: false, channel_id: channel_1.id)
        sub_2 = Subscriber.create(name: 'John', age: 20, top_market: true, channel_id: channel_2.id)

        visit "/subscribers/#{sub_1.id}"

        expect(current_path).to eq("/subscribers/#{sub_1.id}")

        click_link "Update Subscriber"

        expect(current_path).to eq("/subscribers/#{sub_1.id}/edit")

        fill_in 'Name', with: 'Jacoby'
        fill_in 'Age', with: 27
        choose 'In Top Market'

        click_button "Update Subscriber"

        expect(current_path).to eq("/subscribers/#{sub_1.id}")

        expect(page).to have_content("Jacoby")
        expect(page).to have_content("27")
        expect(page).to have_content("true")
    end 
end 