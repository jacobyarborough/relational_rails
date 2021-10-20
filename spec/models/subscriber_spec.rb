require 'rails_helper'

RSpec.describe Subscriber do
  it {should belong_to :channel}
  describe 'class methods' do 
    before(:each) do 
      @channel_1 = Channel.create!(name: 'ABC', cost: 25, spanish: false)
      @sub_1 = @channel_1.subscribers.create!(name: 'Jacob', age: 25, top_market: false)
      @sub_2 = @channel_1.subscribers.create!(name: 'John', age: 20, top_market: true)
      @sub_3 = @channel_1.subscribers.create!(name: 'Jacoby', age: 27, top_market: true)
    end 

    describe '::get_true' do 
      it 'returns only records where top_market is true' do 
        expect(Subscriber.get_true).to eq([@sub_2, @sub_3])
      end 
    end 
  end 
end