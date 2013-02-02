module ChannelAPI
  class V1 < Grape::API
    version 'v1', :using => :path, :vendor => 'RESTpack', :format => :json

    resource :channels do
      get do        
        channels = Channel.all(:order => [ :id.asc ])
        present channels, with: Channel::Entity
      end
      
      params do
        requires :id, :type => Integer
      end
      get ":id" do
        if channel = Channel.first(:id => params[:id].to_i)
          channel
        else
          error!({:error => 'Not Found'}, 404)
        end
      end
      
      post do
        channel = Channel.create(name: params['name'])
        
        if channel.valid?
          channel
        else
          error!({:error => 'Invalid request'}, 400)
        end
      end
    end
  end
end