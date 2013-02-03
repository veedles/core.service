require 'spec_helper'

describe Domain do
  it { should validate_presence_of(:identifier) }
  it { should belong_to(:application) }
 
  context 'when creating' do
    let(:channel) { Channel.create name: 'Channel' }
    let(:application) { Application.create name: 'Application', channel: channel }

    context 'a valid domain' do
      subject(:domain) { Domain.create identifier: 'www.rubyjobs.ie', application: application }
      it {should be_saved}
    end

    context 'a domain with too long an identifier' do
      subject(:domain) { Domain.create identifier: 'x' * 513 }
      it {should_not be_saved}
      it 'should have a identifier too long error' do
        domain.errors[:identifier].should include("Identifier must be at most 512 characters long")
      end
    end
  end
end