# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/reloader" if development?

require 'erb'

# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# Set up the database and models
require APP_ROOT.join('config', 'database')

# Twitter stuffs


require 'time'
require 'twitter'
require 'yaml'

require 'simple_oauth'
require 'omniauth-twitter'
require 'net/https'

# TWITTER_API = YAML.load_file('config/secret.yaml')

$twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['TWITTER_KEY']
  config.consumer_secret = ENV['TWITTER_SECRET']
  config.access_token = ENV['TWITTER_TOKEN']
  config.access_token_secret = ENV['TWITTER_TOKEN_SECRET']
end

use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
end