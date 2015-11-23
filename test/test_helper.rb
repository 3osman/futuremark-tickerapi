ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  cached_averages = {"FI": {"3D" : Average.new(current_average: 500, number_of_entries: 10)}}

  # Add more helper methods to be used by all tests here...
end
