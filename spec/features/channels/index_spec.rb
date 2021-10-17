require 'rails_helper'

RSpec.describe 'the channels index page' do
    before :each do 
        @channel_1 = Channel.create(name: 'ABC', cost: 25, spanish: false)
        @channel_2 = Channel.create(name: 'CBS', cost: 20, spanish: true)
        @channel_3 = Channel.create(name: 'NBC', cost: 15, spanish: true)
    end 
    it 'shows a list of all channels' do
        visit "/channels"

        expect(current_path).to eq('/channels')
        expect(page).to have_content(@channel_1.name)
        expect(page).to have_content(@channel_2.name)
        expect(page).to have_content(@channel_3.name)
    end 

    it 'links to each channels show page' do
        visit "/channels"

        click_on @channel_1.name

        expect(current_path).to eq("/channels/#{@channel_1.id}")
    end 
end 