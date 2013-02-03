require 'spec_helper'

describe Application do
  it { should validate_presence_of(:name) }
  it { should belong_to(:channel) }
 
  context 'when creating' do
    let(:channel) { Channel.create name: 'Channel' }

    context 'a valid application' do
      subject(:application) { Application.create name: 'Application', channel: channel }
      it {should be_saved}
    end

    context 'an application with too long a name' do
      subject(:application) { Application.create name: 'x' * 129 }
      it {should_not be_saved}
      it 'should have a name too long error' do
        application.errors[:name].should include("Name must be at most 128 characters long")
      end
    end
  end
end