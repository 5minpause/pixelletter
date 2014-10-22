require 'simplecov'
SimpleCov.start do
  add_filter ".bundle"
  add_filter "spec"
end
require 'rspec'
require 'test_xml/spec'
require 'pixelletter'
require 'fakeweb'

RSpec.configure do |c|
  c.mock_with :rspec
end
