require 'simplecov'
SimpleCov.start
require 'rspec'
require 'rspec/autorun'
require 'pixelletter'

RSpec.configure do |c|
  c.mock_with :rspec
end