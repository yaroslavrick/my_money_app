# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.3'

gem 'bootsnap', '~> 1.16', require: false
gem 'importmap-rails', '~> 1.1.5'
gem 'jbuilder', '~> 2.11.5'
gem 'kaminari', '~> 1.2.2'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.4'
gem 'sassc-rails', '~> 2.1.2'
gem 'sprockets-rails', '~> 3.4.2'
gem 'sqlite3', '~> 1.4'
gem 'stimulus-rails', '~> 1.2.1'
gem 'turbo-rails', '~> 1.3.3'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'bundler-audit', '~> 0.9.1'
  gem 'debug', '~> 1.7.1', platforms: %i[mri mingw x64_mingw]
  gem 'fasterer', '~> 0.10.0'
  gem 'pry', '~> 0.14.1'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rubocop', '~> 1.44.1'
  gem 'rubocop-md', '~> 1.2.0'
  gem 'rubocop-performance', '~> 1.15.2'
  gem 'rubocop-rails', '~> 2.17.4'
  gem 'rubocop-rake', '~> 0.6.0'
  gem 'rubocop-rspec', '~>2.18.1'
end

group :development do
  gem 'ffaker', '~> 2.21'
  gem 'web-console', '~> 4.2.0'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
