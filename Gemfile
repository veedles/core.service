source :rubygems
gem 'grape', '~> 0.2.6'
gem 'datamapper', '~> 1.2.0'
gem 'require_all', '~> 1.2.1'

group :test, :development do
  gem 'pry', '~> 0.9.11.4'
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
  gem 'foreman', '~> 0.61.0'
end

group :production do
  gem 'pg', '~> 0.14.1'
  gem 'dm-postgres-adapter', '~> 1.2.0'
end
