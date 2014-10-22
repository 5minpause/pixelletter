# encoding: utf-8

require 'active_support/core_ext'
require 'attr_required'
require 'attr_optional'
require 'rest_client'
require 'yaml'

module Pixelletter

  ENDPOINT = {
    :production => 'https://www.pixelletter.de/xml/index.php',
    :sandbox => 'http://www.fakeweb.test'
  }

  def self.endpoint
    if sandbox?
      Pixelletter::ENDPOINT[:sandbox]
    else
      Pixelletter::ENDPOINT[:production]
    end
  end

  def self.sandbox?
    @@sandbox
  end

  def self.sandbox!
    self.sandbox = true
  end

  def self.sandbox=(boolean)
    @@sandbox = boolean
  end

  self.sandbox = false


  def self.load_initial_values
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
end

require 'pixelletter/base'
require 'pixelletter/request/request'
require 'pixelletter/request/xml_builder'
# require 'pixelletter/order/order'
# require 'pixelletter/order/text_order'
