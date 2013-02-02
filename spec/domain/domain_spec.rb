require 'spec_helper'

describe Domain do
  before(:each) do
    @channel = Channel.create name: 'Channel'
    @application = Application.create name: 'Application', channel: @channel
    @domain = Domain.new identifier: 'www.rubyjobs.ie', application: @application
  end

  specify 'is valid' do
    @domain.should be_valid
  end
  
  specify 'identifier is required' do
    @domain.identifier = nil
    @domain.should_not be_valid
    @domain.errors[:identifier].should include("Identifier must not be blank")
  end
end

