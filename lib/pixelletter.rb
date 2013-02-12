require 'active_support/core_ext'
require 'attr_required'
require 'attr_optional'
require 'restclient_with_cert'
require 'yaml'

module Pixelletter
  if File.exists?("../CREDENTIALS")
    f = (File.join(File.dirname(__FILE__), "CREDENTIALS"))
    yml = YAML.load(open(f))
    ENV['EMAIL'] = yml['email']
    ENV['PASSWORD'] = yml['password']
  else
    ENV['EMAIL'] = 'a'
    ENV['PASSWORD'] = 'b'
  end
end

require 'pixelletter/base'
require 'pixelletter/request/request'
require 'pixelletter/request/xml_builder'
