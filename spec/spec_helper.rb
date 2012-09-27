$: << File.dirname(__FILE__)
ENV['RACK_ENV'] = "test"
require 'simplecov'
SimpleCov.start

require 'bundler/setup'
Dir["./lib/*.rb"].each {|file| require file }
MiniMongo.database_url = "mongodb://:@localhost:27017/posts"
Dir["./spec/models/*.rb"].each {|file| require file }

RSpec.configure do |config|

  config.before(:each) do
    Post.remove_all
  end
end
