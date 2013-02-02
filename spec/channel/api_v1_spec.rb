require 'spec_helper'

describe 'Channel API v1' do
  include Rack::Test::Methods

  let(:app) { App.new }
  
  before(:each) do
    ENV['RESTFUL_ACCESS_KEY'] = '1234'
    Channel.destroy

    @first_channel = Channel.create(name: 'Ruby Jobs')
    @second_channel = Channel.create(name: 'Beer Roulette')
  end

  describe 'get' do
    describe 'with no credentials' do
      it 'returns unauthorised' do
        get '/api/v1/channels'
        last_response.status.should == 401
      end
    end
    
    describe 'with invalid credentials' do
      before(:each) do
        authorize '', 'badpassword'
      end
      
      it 'returns unauthorised' do
        authorize 'username', 'badpassword'
        get '/api/v1/channels'
        last_response.status.should == 401
      end
    end
    
    describe 'with valid credentials' do
      before(:each) do
        authorize '', '1234'
      end
      
      it 'lists all channels' do
        get '/api/v1/channels'
        last_response.should be_ok
        channels = JSON.parse last_response.body

        channels.length.should == 2
        channels[0]['name'].should == @first_channel.name
        channels[1]['name'].should == @second_channel.name
      end
      
      it 'should 404 for a missing channel' do
        get '/api/v1/channels/999'
        last_response.status.should == 404
      end

      it 'should return a valid channel' do
        get "/api/v1/channels/#{@second_channel.id}"
        last_response.should be_ok
        channel = JSON.parse last_response.body

        channel['id'].should == @second_channel.id
        channel['name'].should == @second_channel.name
      end
    end
  end

  describe 'post' do
    describe 'with valid credentials' do
      before(:each) do
        authorize '', '1234'
      end
      
      it "returns error when new channel is invalid" do
        header "HTTP_ACCEPT", "application/json"
        expect {
          post "/api/v1/channels", {}
        }.to_not change{Channel.count}
        last_response.status.should == 400
      end
    
      it "creates a valid channel" do
        header "HTTP_ACCEPT", "application/json"
        expect {
          post "/api/v1/channels", {:name => 'New Channel'}
        }.to change{Channel.count}

        last_response.status.should == 201
        channel = JSON.parse last_response.body
      
        channel['id'].should == @second_channel.id + 1
        channel['name'].should =='New Channel'
      end
    end
  end
end
