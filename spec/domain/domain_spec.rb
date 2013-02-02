require 'spec_helper'

describe Domain do
  before(:each) do
    @channel = Channel.create name: 'Channel'
    @website = Website.create name: 'Website', channel: @channel
    @domain = Domain.new identifier: 'www.rubyjobs.ie', website: @website
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

