require 'rails_helper'

RSpec.describe 'the channels show page' do
    it 'shows the channel and attributes' do
        channel_1 = Channel.create!(name: 'ABC', cost: 25, spanish: false)
        channel_2 = Channel.create!(name: 'CBS', cost: 20, spanish: true)
        visit "/channels/#{channel_1.id}"
        expect(current_path).to eq("/channels/#{channel_1.id}")
        expect(page).to have_content(channel_1.name)
        expect(page).to have_content(channel_1.cost)
        expect(page).to have_content(channel_1.spanish)
        expect(page).to_not have_content(channel_2.name)
        expect(page).to_not have_content(channel_2.cost)
        expect(page).to_not have_content(channel_2.spanish)
    end 
end 