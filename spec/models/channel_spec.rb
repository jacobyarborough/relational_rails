require 'rails_helper'

RSpec.describe Channel do
  it {should have_many :subscribers}

  describe 'instance methods' do 
    describe '#sub_count' do 
      it 'returns the number of subscribers for a channel' do 
        channel_1 = Channel.create(name: 'ABC', cost: 25, spanish: false)
        sub_1 = channel_1.subscribers.create(name: 'Jacob', age: 25, top_market: false)

        expect(channel_1.sub_count).to eq(1)
      end 
    end 

    describe '#recently_created' do 
      it 'should return an array of channels with the most recently created channels coming first' do
        channel_1 = Channel.create(name: 'ABC', cost: 25, spanish: false)
        channel_2 = Channel.create(name: 'CBS', cost: 20, spanish: true)
        channel_3 = Channel.create(name: 'NBC', cost: 15, spanish: true)

        expect(Channel.recently_created).to eq([channel_3, channel_2, channel_1])
      end 
    end
    
    describe '#index_view' do 
      it 'can restrict the view of the index if there is a criteria entered' do 
        channel_1 = Channel.create(name: 'ABC', cost: 25, spanish: false)
        sub_1 = subscribers.create(name: 'Jacob', age: 25, top_market: false, channel_id: 799)
        sub_2 = subscribers.create(name: 'Joey', age: 28, top_market: false, channel_id: 799)
        params = {"utf8"=>"✓", "minimum_age_of_subscribers"=>"25", "commit"=>"Return Subscribers Based on Age", "controller"=>"channel_subscribers", "action"=>"index", "channel_id"=>"799"}
        expect(channel_1.index_view(params).length).to eq(1)
      end 
    end 
  end 
end
