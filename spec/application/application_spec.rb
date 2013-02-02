require 'spec_helper'

describe Application do
  before(:each) do
    @channel = Channel.create name: 'Channel'
    @application = Application.new name: 'Application', channel: @channel
  end

  specify 'is valid' do
    @application.should be_valid
  end
  
  specify 'name is required' do
    @application.name = nil
    @application.should_not be_valid
    @application.errors[:name].should include("Name must not be blank")
  end
end

