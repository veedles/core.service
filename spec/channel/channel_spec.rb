require 'spec_helper'

describe Channel do
  it { should validate_presence_of(:name) }

  context 'when creating' do

    context 'a valid channel' do
      subject(:channel) { Channel.create name: 'Ruby Jobs' }
      it {should be_saved}
    end

    context 'a channel with too long a name' do
      subject(:channel) { Channel.create name: 'x' * 513 }
      it {should_not be_saved}
      it 'should have a name too long error' do
        channel.errors[:name].should include("Name must be at most 512 characters long")
      end
    end
  end
end