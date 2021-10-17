require 'rails_helper'

RSpec.describe 'the subscribers index page' do
    it 'shows a list of all subscribers' do
        channel_1 = Channel.create(name: 'ABC', cost: 25, spanish: false)
        channel_2 = Channel.create(name: 'CBS', cost: 20, spanish: true)
        channel_3 = Channel.create(name: 'NBC', cost: 15, spanish: true)
        sub_1 = Subscriber.create(name: 'Jacob', age: 25, top_market: false, channel_id: channel_1.id)
        sub_2 = Subscriber.create(name: 'John', age: 20, top_market: true, channel_id: channel_2.id)
        sub_3 = Subscriber.create(name: 'Joe', age: 18, top_market: true, channel_id: channel_3.id)
        visit "/subscribers"

        expect(current_path).to eq('/subscribers')
        expect(page).to have_content(sub_1.name)
        expect(page).to have_content(sub_1.age)
        expect(page).to have_content(sub_1.top_market)
        expect(page).to have_content(sub_2.name)
        expect(page).to have_content(sub_2.age)
        expect(page).to have_content(sub_2.top_market)
        expect(page).to have_content(sub_3.name)
        expect(page).to have_content(sub_3.age)
        expect(page).to have_content(sub_3.top_market)
    end 
end 