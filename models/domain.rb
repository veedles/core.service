class Domain
  include DataMapper::Resource
  property :id, Serial
  property :identifier, String, :length => 512
  timestamps :at
  
  validates_presence_of :identifier
  
  belongs_to :application
  has n, :configurations
  
  class Entity < Grape::Entity
    expose :id, :identifier, :config, :application_id
    expose :configurations, :using => Configuration::Entity
  end
end