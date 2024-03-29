require 'rails_helper'

RSpec.describe 'Channels subscribers index' do 
    before :each do
        @channel_1 = Channel.create!(name: 'ABC', cost: 25, spanish: false)
        @sub_1 = @channel_1.subscribers.create!(name: 'Jacob', age: 22, top_market: false)
        @sub_2 = @channel_1.subscribers.create!(name: 'John', age: 35, top_market: true)
        @sub_3 = @channel_1.subscribers.create!(name: 'Joey', age: 26, top_market: true)
    end 
    it 'shows all the subscribers of a channel' do
        visit "channels/#{@channel_1.id}/subscribers"

        expect(page).to have_content(@sub_1.name)
        expect(page).to have_content(@sub_1.age)
        expect(page).to have_content(@sub_1.top_market)
        expect(page).to have_content(@sub_2.name)
        expect(page).to have_content(@sub_2.age)
        expect(page).to have_content(@sub_2.top_market)
    end 

    it 'links to each subscribers show page' do
        visit "/channels/#{@channel_1.id}/subscribers"

        click_on @sub_1.name

        expect(current_path).to eq("/subscribers/#{@sub_1.id}")
    end 

    it 'adds a link to the channel_subscribers page to create a new subscriebr for that channel' do 
        visit "/channels/#{@channel_1.id}/subscribers"

        expect(current_path).to eq("/channels/#{@channel_1.id}/subscribers")

        click_link "Create Subscriber"

        expect(current_path).to eq("/channels/#{@channel_1.id}/subscribers/new")

        fill_in "Name", with: "Jerry"
        fill_in "Age", with: 36
        choose "In Top Market"

        click_button "Create Subscriber"

        expect(current_path).to eq("/channels/#{@channel_1.id}/subscribers")
        expect(page).to have_content("Jerry")
        expect(page).to have_content("Age: 36")
        expect(page).to have_content("Top Market: true")
    end 

    it 'has a link to update a subscriber' do 
        visit "/channels/#{@channel_1.id}/subscribers"

        expect(current_path).to eq("/channels/#{@channel_1.id}/subscribers")

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

    it 'has a number entry form to limit number of results shown' do 
        # As a visitor
        # When I visit the Parent's children Index Page
        # I see a form that allows me to input a number value
        # When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
        # Then I am brought back to the current index page with only the records that meet that threshold shown.

        visit "/channels/#{@channel_1.id}/subscribers"

        expect(current_path).to eq("/channels/#{@channel_1.id}/subscribers")

        fill_in "Minimum age of subscribers", with: 25

        click_button "Return Subscribers Based on Age"

        expect(current_path).to eq("/channels/#{@channel_1.id}/subscribers")

        expect(page).to have_content(@sub_2.name)
        expect(page).to have_content(@sub_3.name)
        expect(page).not_to have_content(@sub_1.name)
    end 

    it 'has a link to delete a subscriber' do 
        visit "/channels/#{@channel_1.id}/subscribers"

        click_link("Delete #{@sub_3.name}")

        expect(current_path).to eq("/subscribers")
        expect(page).not_to have_content(@sub_3.name)
    end 
end 