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
        visit "channels/#{@channel_1.id}/subscribers"

        click_on @sub_1.name

        expect(current_path).to eq("/subscribers/#{@sub_1.id}")
    end 
end 