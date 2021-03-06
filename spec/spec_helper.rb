require 'simplecov'
SimpleCov.start

ENV["RAILS_ENV"] = "development"

require 'bundler/setup'
Bundler.require

require 'rspec/its'
require 'apivore'

require File.expand_path('../../lib/swagger_yard', __FILE__)
require File.expand_path('../fixtures/dummy/config/initializers/swagger_yard.rb', __FILE__)

SwaggerYard.register_custom_yard_tags!

Dir["./spec/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.mock_with :mocha

  config.order = 'random'

  config.include SaveConfig
end
