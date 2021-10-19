require 'rails_helper'

RSpec.describe 'Channels subscribers index' do 
    before :each do
        @channel_1 = Channel.create!(name: 'ABC', cost: 25, spanish: false)
        @sub_1 = @channel_1.subscribers.create!(name: 'Jacob', age: 25, top_market: false)
        @sub_2 = @channel_1.subscribers.create!(name: 'John', age: 20, top_market: true)
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
end 