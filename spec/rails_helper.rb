# This file is copied to spec/ when you run "rails generate rspec:install"
require "spec_helper"
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require "rspec/rails"
require "database_cleaner"
require "uri"

ActiveRecord::Migration.maintain_test_schema!

Dir[Rails.root.join("spec", "support", "*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include FactoryBot::Syntax::Methods
  config.include ServiceSignIn
  config.use_transactional_fixtures = true

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
end
