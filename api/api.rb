class API < Grape::API
  format :json
  get do
    {:name => 'core.service', :status => 'ok'}
  end
  
  http_basic do |username, password|
    access_key = ENV['RESTFUL_ACCESS_KEY']
    raise 'service access key not set' unless access_key
    
    password == access_key
  end
  
  prefix 'api'
  mount ChannelAPI::V1
  mount DomainAPI::V1
  mount ConfigurationAPI::V1
end