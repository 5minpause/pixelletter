require 'simplecov'
SimpleCov.start do
  add_filter ".bundle"
end
require 'rspec'
require 'rspec/autorun'
require 'test_xml/spec'
require 'pixelletter'
require 'fakeweb'

RSpec.configure do |c|
  c.mock_with :rspec
end