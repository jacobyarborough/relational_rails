require 'rails_helper'

RSpec.describe Channel do
  it {should have_many :subscribers}

  describe 'instance methods' do 
    describe '#sub_count' do 
      before :each do 
        @channel_1 = Channel.create(name: 'ABC', cost: 25, spanish: false)
        @sub_1 = @channel_1.subscribers.create(name: 'Jacob', age: 25, top_market: false)
      end 
      it 'returns the number of subscribers for a channel' do 
        expect(@channel_1.sub_count).to eq(1)
      end 
    end 
  end 
end
