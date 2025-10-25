# frozen_string_literal: true

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'logger' # Required for Rails 7.0.8.7 compatibility with Ruby 3.1.2
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.
