require 'rubygems'
require 'bundler/setup'

require_relative 'config/environment'

task :default => :test
task :test => :spec

begin
  require "rspec/core/rake_task"

  desc "Run all specs"
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.rspec_opts = ['-cfs']
  end
rescue LoadError
end

task :start do
  sh %{ foreman start -p 1111 }
end

namespace :db do  
  desc 'Auto-migrate the database (destroys data)'
  task :migrate do
    DataMapper.auto_migrate!
  end

  desc 'Auto-upgrade the database (preserves data)'
  task :upgrade do
    DataMapper.auto_upgrade!
  end
  
  desc 'Delete and seeds the database for development'
  task :dev_seed do
    if ENV["RACK_ENV"] == 'development'
      Configuration.destroy
      Channel.destroy
      Application.destroy
      Domain.destroy
      
      Configuration.create name: 'Person1', value: { :age => 34, :name => "Sarah" }
      Configuration.create name: 'Person2', value: { :age => 34, :name => "Gavin" }
      Configuration.create name: 'Key', value: { :description => "Root Config" }
      
      Configuration.create name: 'RESTFUL_USERS_SERVICE', value: { :domain => "localhost:1112" }
      Configuration.create name: 'RESTFUL_GROUPS_SERVICE', value: { :domain => "localhost:1113" }
    
      channel = Channel.create name: 'Developer Jobs Websites'
      
      rubyjobs = Application.create name: 'Ruby Jobs', channel: channel
      Configuration.create name: 'domains', application: rubyjobs, value: {
        :home => 'www.rubyjobs.ie:8080',
        :auth => 'account.rubyjobs.ie:4567'
      }
      Configuration.create name: 'omniauth', application: rubyjobs, value: {
        :twitter => {
          :consumer_key => 'aaaaaaaaaaaaaaa',
          :consumer_secret => 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb'
        },
        :google_oauth2 => {
          :consumer_key => 'ccccccccccccccc',
          :consumer_secret => 'dddddddddddddddddddddddddddddd'
        }       
      }
      
      pythonjobs = Application.create name: 'Python Jobs', channel: channel
      Configuration.create name: 'domains', application: pythonjobs, value: {
        :home => 'www.pythonjobs.ie:8080',
        :auth => 'account.pythonjobs.ie:4567'
      }
      Configuration.create name: 'omniauth', application: pythonjobs, value: {
        :twitter => {
          :consumer_key => 'eeeeeeeeeeeeeeee',
          :consumer_secret => 'fffffffffffffffffffffffffffffff'
        },
        :google_oauth2 => {
          :consumer_key => 'gggggggggggggggggggggggggggggggggg',
          :consumer_secret => 'hhhhhhhhhhhhh'
        }       
      }
      
      Domain.create identifier: 'www.rubyjobs.ie', application: rubyjobs      
      Domain.create identifier: 'account.rubyjobs.ie', application: rubyjobs
      Domain.create identifier: 'www.pythonjobs.ie', application: pythonjobs
      Domain.create identifier: 'account.pythonjobs.ie', application: pythonjobs
      
      channel = Channel.create name: 'Coffee Roulette'
      Configuration.create name: 'Key', channel: channel, value: { :description => "Channel Config" }
      Configuration.create name: 'channel_key', channel: channel, value: {
        :aaa => '111',
        :bbb => '222'
      }
      application = Application.create name: 'Coffee Roulette Application', channel: channel
      Configuration.create name: 'Key', application: application, value: { :description => "application Config" }
      Configuration.create name: 'application_key', application: application, value: {
        :ccc => '333',
        :ddd => '444'
      }
      domain = Domain.create identifier: 'www.coffeeroulette.ie', application: application    
      Configuration.create name: 'Key', domain: domain, value: { :description => "Domain Config" }
      Configuration.create name: 'domain_key', domain: domain, value: {
        :eee => '555',
        :fff => '666'
      }
      
      p "There are now #{Configuration.count} confgurations, #{Domain.count} domains, #{Application.count} applications and #{Channel.count} channels"
    else
      raise "This is a :development only task. Currently [#{ENV["RACK_ENV"]}]"
    end
  end
end

