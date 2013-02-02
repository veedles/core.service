class Channel
  include DataMapper::Resource
  property :id, Serial
  property :name, String, :length => 512
  timestamps :at
  
  validates_presence_of :name
  
  has n, :websites
  has n, :configurations
  
  class Entity < Grape::Entity
    expose :id, :name
    expose :websites, :using => Website::Entity
    expose :configurations, :using => Configuration::Entity
  end
end