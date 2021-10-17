require 'rails_helper'

RSpec.describe Subscriber do
  it {should belong_to :channel}
end