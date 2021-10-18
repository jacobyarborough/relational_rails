require 'rails_helper'

RSpec.describe 'the channels show page' do
    before :each do 
        @channel_1 = Channel.create!(name: 'ABC', cost: 25, spanish: false)
        @channel_2 = Channel.create!(name: 'CBS', cost: 20, spanish: true)
        @sub_1 = @channel_1.subscribers.create(name: 'Jacob', age: 25, top_market: false)
        @sub_2 = @channel_2.subscribers.create(name: 'John', age: 20, top_market: true)
    end 
    it 'shows the channel and attributes' do
        visit "/channels/#{@channel_1.id}"
        expect(current_path).to eq("/channels/#{@channel_1.id}")
        expect(page).to have_content(@channel_1.name)
        expect(page).to have_content(@channel_1.cost)
        expect(page).to have_content(@channel_1.spanish)
        expect(page).to_not have_content(@channel_2.name)
        expect(page).to_not have_content(@channel_2.cost)
        expect(page).to_not have_content(@channel_2.spanish)
    end 

    it "links to the channel's subscriber index page" do
        visit "/channels/#{@channel_1.id}"

        click_on "Subscribers of #{@channel_1.name}"

        expect(current_path).to eq("/channels/#{@channel_1.id}/subscribers")
    end 

    it 'shows the count of subscribers' do 
        visit "/channels/#{@channel_1.id}"

        expect(page).to have_content("Number of Subscribers: 1")
    end 
end 