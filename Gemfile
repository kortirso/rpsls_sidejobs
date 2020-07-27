# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.7.1'

# rake
gem 'rake', '~> 13.0.1'

# database connection
gem 'pg', '~> 1.2.3'
gem 'sequel', '~> 5.32.0'

# serialization
gem 'fast_jsonapi', '~> 1.5'

# Config
gem 'config', '~> 2.2.1'

# rabbitmq
gem 'bunny', '~> 2.15.0'

group :development do
  gem 'rubocop', '~> 0.85.0', require: false
  gem 'rubocop-performance', require: false
end

group :test do
  gem 'database_cleaner-sequel', '~> 1.8.0'
  gem 'factory_bot', '~> 5.2.0'
  gem 'rspec', '~> 3.9.0'
end
