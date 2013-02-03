require 'spec_helper'

describe Configuration do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:value) }
  it { should belong_to(:channel) }
  it { should belong_to(:application) }
  it { should belong_to(:domain) }

  context 'when creating a channel configuration' do
    let(:channel) { Channel.create name: 'Channel' }
    subject(:configuration) { Configuration.create name: 'data_config', channel: channel,
        value: { :max_shards => 200, :shard_size => 10000 }}
    it {should be_saved}
    it "should have the channel" do
      configuration.reload.channel.should == channel
    end
    it "should not be returned by Configuration.root" do
      Configuration.root.should_not include(configuration)
    end
  end

  context 'when creating a application configuration' do
    let(:channel) { Channel.create name: 'Channel' }
    let(:application) { Application.create name: 'Application', channel: channel }
    subject(:configuration) { Configuration.create name: 'app_config', application: application,
        value: { :num_instances => 3}}
    it {should be_saved}
    it "should not be returned by Configuration.root" do
      Configuration.root.should_not include(configuration)
    end
  end

  context 'when creating a domain configuration' do
    let(:channel) { Channel.create name: 'Channel' }
    let(:application) { Application.create name: 'Application', channel: channel }
    let(:domain) { Domain.create identifier: 'www.rubyjobs.ie', application: application }
    subject(:configuration) { Configuration.create name: 'domain_config', domain: domain,
        value: { :max_users => 200, :name_format => "<firstname> <surname>" }}
    it {should be_saved}
    it "should not be returned by Configuration.root" do
      Configuration.root.should_not include(configuration)
    end
  end

  context 'when creating a root configuration' do
    subject(:configuration) { Configuration.create name: 'a_root_config',
        value: { :country => 'IE', :city => "DUB" }}
    it {should be_saved}
    it "should not be returned by Configuration.root" do
      Configuration.root.should include(configuration)
    end
  end
end

