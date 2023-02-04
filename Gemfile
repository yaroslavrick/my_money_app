# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.3'

gem 'bootsnap', require: false
gem 'importmap-rails'
gem 'jbuilder'
gem 'kaminari', '~> 1.2.2'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.4'
gem 'sassc-rails'
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.4'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'pry', '~> 0.14.1'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rubocop'
end

group :development do
  gem 'ffaker', '~> 2.21'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
