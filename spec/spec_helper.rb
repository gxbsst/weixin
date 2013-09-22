# require 'rubygems'
# ENV["RACK_ENV"] ||= 'test'

# # Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

# # RSpec.configure do |config|
# #   # config.use_transactional_fixtures = true
# #   config.before(:suite) do
# #     DatabaseCleaner.strategy = :transaction
# #   end
# #   config.include FactoryGirl::Syntax::Methods
# #   config.after(:each) do
# #     DatabaseCleaner.clean
# #   end
# # end


require File.expand_path("../../boot", __FILE__)
# require 'rack/test'
# require "factory_girl"

# Bundler.require

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
  conf.include FactoryGirl::Syntax::Methods

  def app
    Sinatra::Application
  end
end