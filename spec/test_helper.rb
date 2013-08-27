
ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require 'sinatra/test_helpers'

# The base for a test case, all minitest cases under this directory should sub
# class this.
class TestCase < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    Default::App
  end

  def assert_redirect(destination)
    env = last_request.env
    uri = env['rack.url_scheme'] + '://' + env['SERVER_NAME'] + destination
    assert_equal(uri, last_response.location)
  end
end

spec_dir = File.dirname(__FILE__)
Dir.glob(File.expand_path(File.join(spec_dir, '**', "*_spec.rb"))).each do |f|
  require f
end

