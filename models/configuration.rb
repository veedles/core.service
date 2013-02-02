class Configuration
  include DataMapper::Resource
  property :id, Serial
  property :name, String, :length => 512
  property :value, DataMapper::Property::Json
  timestamps :at
  
  validates_presence_of :name
  validates_presence_of :value
  
  belongs_to :channel, :required => false
  belongs_to :website, :required => false
  belongs_to :domain, :required => false
  
  def self.root
    all(channel_id: nil, website_id: nil, domain_id: nil)
  end
  
  class Entity < Grape::Entity
    expose :name, :value
  end
end