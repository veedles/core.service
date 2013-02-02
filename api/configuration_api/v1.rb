module ConfigurationAPI  
  class V1 < Grape::API
    version 'v1', :using => :path, :vendor => 'RESTful', :format => :json

    resource :configuration do
      get :all do        
        channels = Channel.all(:order => [ :id.asc ])
        
        present :configurations => present(Configuration.root, with: Configuration::Entity),
                :channels => present(channels, with: Channel::Entity)
      end
    end
  end
end