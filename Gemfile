# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'active_model_serializers', '~> 0.10.13'
gem 'bootsnap', require: false
gem 'devise', '~> 4.8'
gem 'friendly_id', '~> 5.4.0'
gem 'pagy', '~> 5.10'
gem 'pg', '~> 1.3'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.2', '>= 7.0.2.2'
gem 'rails_admin', '~> 3.0.rc4'
gem 'roo', '~> 2.9'
gem 'rubocop', '~> 1.25', require: false
gem 'rubocop-rails', '~> 2.13', require: false
gem 'sassc-rails', '~> 2.1'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'byebug', '~> 11.1'
  gem 'dotenv-rails', '~> 2.7'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'ffaker', '~> 2.20'
  gem 'rspec-rails', '~> 5.1'
end

group :test do
  gem 'database_cleaner-active_record', '~> 2.0'
end

group :development do
  gem 'annotate', '~> 3.2'
end
