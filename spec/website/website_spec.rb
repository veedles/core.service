require 'spec_helper'

describe Website do
  before(:each) do
    @channel = Channel.create name: 'Channel'
    @website = Website.new name: 'Website', channel: @channel
  end

  specify 'is valid' do
    @website.should be_valid
  end
  
  specify 'name is required' do
    @website.name = nil
    @website.should_not be_valid
    @website.errors[:name].should include("Name must not be blank")
  end
end

