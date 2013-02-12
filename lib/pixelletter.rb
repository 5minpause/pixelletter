require 'active_support/core_ext'
require 'attr_required'
require 'attr_optional'
require 'restclient_with_cert'
require 'yaml'

module Pixelletter
  if File.exists?(File.join(File.dirname('../'), "CREDENTIALS"))
    f = File.join(File.dirname('../'), "CREDENTIALS")
    yml = YAML.load(open(f))
    ENV['EMAIL'] = yml['email']
    ENV['PASSWORD'] = yml['password']
  else
    ENV['EMAIL'] = nil
    ENV['PASSWORD'] = nil
  end
end

require 'pixelletter/base'
require 'pixelletter/request/request'
require 'pixelletter/request/xml_builder'
# require 'pixelletter/order/order'
# require 'pixelletter/order/text_order'
