# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.5.0'

gem 'active_model_serializers', '~> 0.10.7'
gem 'bootsnap', '~> 1.3.0', require: false
gem 'figaro', '~> 1.1.1'
gem 'knock', '~> 2.1.1'
gem 'pg', '~> 1.0.0'
gem 'puma', '~> 3.11.4'
gem 'rack-cors', '~> 1.0.2'
gem 'rails', '~> 5.2.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 4.8.2'
  gem 'faker', '~> 1.8.7'
  gem 'rspec-rails', '~> 3.7.2'
  gem 'rubocop', '~> 0.55.0', require: false
  gem 'rubocop-rspec', '~> 1.25.1'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'json_matchers', '~> 0.9.0'
  gem 'shoulda-matchers', '~> 3.1.2'
  gem 'simplecov', '~> 0.16.1', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
