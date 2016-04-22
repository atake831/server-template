source 'https://rubygems.org'

ruby '2.3.0'

gem 'rails', '4.2.6'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'bcrypt', '~> 3.1.7'
gem 'dotenv-rails'

# infra
gem 'unicorn'
gem 'god'
gem 'sidekiq'
gem 'sinatra' # for sidekiq web console
gem 'redis-namespace'

# DB
gem 'mysql2'
gem 'activerecord-mysql-awesome'
gem 'activerecord-import'
gem 'activerecord-refresh_connection'

# App
gem 'whenever', :require => false

# API
gem 'jwt'
gem 'rack-cors'
gem 'weak_parameters'

group :development, :test do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rspec-power_assert' # for is_asserted_by
  gem 'guard-rspec'
  gem 'terminal-notifier'
  gem 'terminal-notifier-guard'
  gem 'factory_girl_rails'
  gem 'autodoc'
  gem 'database_rewinder'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
  gem 'pry-coolline'
  gem 'awesome_print'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'byebug'
end

