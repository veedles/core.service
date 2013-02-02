require 'dm-core'
require 'dm-timestamps'
require 'dm-validations'
require 'dm-aggregates'
require 'dm-migrations'
require 'dm-types'
require 'dm-serializer'
require 'require_all'
require 'json'
require 'grape'

ENV['RACK_ENV'] ||= 'development'

require_rel '../models'

DataMapper.setup(:default, (ENV["DATABASE_URL"] || "sqlite3:///#{File.expand_path(File.dirname(__FILE__))}/../#{ENV['RACK_ENV']}.db"))
DataMapper.finalize

require_rel '../api'
require_relative '../app'