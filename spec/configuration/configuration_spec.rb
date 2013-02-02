require 'spec_helper'

describe Configuration do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:value) }
  it { should belong_to(:channel) }
  it { should belong_to(:application) }
  it { should belong_to(:domain) }

  context 'creation' do
    let(:channel) { Channel.create name: 'Channel' }
    before(:each) do
      @configuration = Configuration.create name: 'some_config_key',
        value: { :age => 34, :name => "Sarah" }, channel: channel
    end
    it 'should be persisted' do @configuration.should be_saved end
  end

end

