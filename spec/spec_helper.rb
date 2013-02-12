require 'simplecov'
SimpleCov.start
require 'rspec'
require 'rspec/autorun'
require 'test_xml/spec'
require 'pixelletter'

RSpec.configure do |c|
  c.mock_with :rspec
end