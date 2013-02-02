require 'spec_helper'

describe Channel do
  before(:each) do
    @channel = Channel.new(name: 'Ruby Jobs')
  end

  specify 'is valid' do
    @channel.should be_valid
  end
  
  specify 'name is required' do
    @channel.name = nil
    @channel.should_not be_valid
    @channel.errors[:name].should include("Name must not be blank")
  end
end

