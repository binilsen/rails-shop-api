# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.3', '>= 7.0.3.1'

# postgres adapter
# gem 'pg'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# fix cors issue
gem 'rack-cors'

# API AUTH

# jwt based devise authentication
gem 'devise_token_auth'

# mongo gem locked at 2.18 for capability with  mongoid-locker
gem 'mongo', '2.18'

# locked version as mongoid 8 does not support mongoid-locker
# mongodb connector
gem 'mongoid', '~> 7.5', '>= 7.5.1'

# for devise
gem 'bson_ext'

# mongoid slug creator
gem 'mongoid-slug'

# needed for devise-token-auth
gem 'mongoid-locker'

# active_storage validator
# gem 'active_storage_validations'

# generate slug
# gem 'friendly_id'

gem 'graphql'
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem 'bcrypt', '~> 3.1.7'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem "rack-cors"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end
