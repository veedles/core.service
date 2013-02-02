module DomainAPI
  class V1 < Grape::API
    version 'v1', :using => :path, :vendor => 'RESTful', :format => :json

    resource :domains do
      get do
        Domain.all(:order => [ :id.asc ])
      end
      
      
      
    end
  end
end