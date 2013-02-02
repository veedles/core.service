source :rubygems
gem 'grape'

gem 'dm-core'
gem 'dm-timestamps'
gem 'dm-validations'
gem 'dm-aggregates'
gem 'dm-migrations'
gem 'dm-types'
gem 'dm-serializer'

gem 'require_all'

group :test do
  gem 'rspec', :require => 'spec'
  gem 'rack-test'
end

group :development do
  gem 'rake', '~> 10.0.2'
  gem 'sqlite3'
  gem 'dm-sqlite-adapter'
  gem 'foreman'
end

group :production do
  gem 'pg'
  gem 'dm-postgres-adapter'
end
