require 'rails_helper'

RSpec.describe 'the subscribers index page' do
    before :each do 
        @channel_1 = Channel.create(name: 'ABC', cost: 25, spanish: false)
        @channel_2 = Channel.create(name: 'CBS', cost: 20, spanish: true)
        @sub_1 = @channel_1.subscribers.create(name: 'Jacob', age: 25, top_market: false)
        @sub_2 = @channel_2.subscribers.create(name: 'John', age: 20, top_market: true)
    end 
    it 'shows a list of all subscribers' do
        visit "/subscribers"

        expect(current_path).to eq('/subscribers')
        expect(page).to have_content(@sub_1.name)
        expect(page).to have_content(@sub_1.age)
        expect(page).to have_content(@sub_1.top_market)
        expect(page).to have_content(@sub_2.name)
        expect(page).to have_content(@sub_2.age)
        expect(page).to have_content(@sub_2.top_market)
    end 

    it 'links to each subscribers show page' do
        visit visit "/subscribers"

        click_on @sub_1.name

        expect(current_path).to eq("/subscribers/#{@sub_1.id}")
    end 
end 