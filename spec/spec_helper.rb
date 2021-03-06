require 'rubygems'
require 'bundler'
Bundler.setup(:default, :test)
require 'rspec'
require 'rack/test'
require 'dm-rspec2'

ENV["RACK_ENV"] ||= 'test'

require_relative '../config/environment'

DataMapper.setup(:default, "sqlite3::memory:")

RSpec.configure do |config|
  config.include(DataMapper::Matchers)
  config.before(:each) { DataMapper.auto_migrate! }
end