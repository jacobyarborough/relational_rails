require 'rails_helper'

RSpec.describe 'the subscribers index page' do
    before :each do 
        @channel_1 = Channel.create(name: 'ABC', cost: 25, spanish: false)
        @channel_2 = Channel.create(name: 'CBS', cost: 20, spanish: true)
        @sub_1 = @channel_1.subscribers.create(name: 'Jacob', age: 25, top_market: false)
        @sub_2 = @channel_2.subscribers.create(name: 'John', age: 20, top_market: true)
        @sub_3 = @channel_2.subscribers.create(name: 'Aaron', age: 21, top_market: true)
    end 
    it 'shows a list of all subscribers' do
        visit "/subscribers"

        expect(current_path).to eq('/subscribers')
        expect(page).not_to have_content(@sub_1.name)
        expect(page).not_to have_content(@sub_1.age)
        expect(page).not_to have_content(@sub_1.top_market)
        expect(page).to have_content(@sub_2.name)
        expect(page).to have_content(@sub_2.age)
        expect(page).to have_content(@sub_2.top_market)
    end 

    it 'links to each subscribers show page' do
        visit "/subscribers"

        click_on @sub_2.name

        expect(current_path).to eq("/subscribers/#{@sub_2.id}")
    end 

    it 'has a link to sort subscribers by alphabetical order' do 
        visit "/subscribers"

        click_link "Sort Alphabetically"

        expect(current_path).to eq("/subscribers")

        expect(@sub_3.name).to appear_before(@sub_2.name)
    end 

    it 'has a link to update a subscriber' do 
        visit "/subscribers"

        expect(current_path).to eq("/subscribers")
   
        expect(page).to have_link("Edit #{@sub_2.name}")
        expect(page).to have_link("Edit #{@sub_3.name}")

        click_link "Edit #{@sub_2.name}"

        expect(current_path).to eq("/subscribers/#{@sub_2.id}/edit")

        fill_in 'Name', with: 'Jacoby'
        fill_in 'Age', with: 27
        choose 'In Top Market'

        click_button "Update Subscriber"

        expect(current_path).to eq("/subscribers/#{@sub_2.id}")

        expect(page).to have_content("Jacoby")
        expect(page).to have_content("27")
        expect(page).to have_content("true")
    end 
end 