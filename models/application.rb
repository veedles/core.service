class Application
  include DataMapper::Resource
  property :id, Serial
  property :name, String, :length => 128
  timestamps :at
  
  validates_presence_of :name
  
  belongs_to :channel
  has n, :domains
  has n, :configurations

  class Entity < Grape::Entity
    expose :id, :name, :channel_id
    expose :domains, :using => Domain::Entity
    expose :configurations, :using => Configuration::Entity
  end
end