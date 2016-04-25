ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'factory_girl'
require 'ffaker'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

Autodoc.configuration.toc = true
RSpec.configure do |config|
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"
  # config.use_transactional_fixtures = true
  config.render_views = true
  config.infer_spec_type_from_file_location!

  config.include FactoryGirl::Syntax::Methods
  config.include Requests::JsonHelpers, type: :request
  config.include Requests::HeaderHelpers, type: :request

  config.before :all do
    FactoryGirl.reload
  end

  # config.before :suite do
    # require Rails.root.join("db", "seeds")
    # DatabaseRewinder.clean_with :truncation, except: %w(truncateしたくないテーブル名)
  # end

  config.after :each do
    DatabaseRewinder.clean
  end

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
  
end

