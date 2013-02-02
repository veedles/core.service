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

group :test, :development do
  gem 'pry'
  gem 'pry-debugger'
  gem 'pry-remote'
  gem 'pry-debugger'
  gem 'pry-stack_explorer'
end

group :test do
  gem 'rspec', :require => 'spec'
  gem 'rack-test'
  gem 'dm-rspec2'
end

group :development do
  gem 'rake', '~> 10.0.3'
  gem 'sqlite3'
  gem 'dm-sqlite-adapter'
  gem 'foreman'
end

group :production do
  gem 'pg'
  gem 'dm-postgres-adapter'
end
