require 'rails_helper'

RSpec.describe Channel do
  it {should have_many :subscribers}
end
