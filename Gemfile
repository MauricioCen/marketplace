# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'active_model_serializers', '~> 0.10.13'
gem 'bootsnap', require: false
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.2', '>= 7.0.2.2'
gem 'rubocop', '~> 1.25', require: false
gem 'rubocop-rails', '~> 2.13', require: false
gem 'sqlite3', '~> 1.4'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'byebug', '~> 11.1'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'ffaker', '~> 2.20'
  gem 'rspec-rails', '~> 5.1'
end

group :test do
  gem 'database_cleaner-active_record', '~> 2.0'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  gem 'annotate', '~> 3.2'
end
