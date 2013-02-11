module Pixelletter
  class Base
    include AttrRequired, AttrOptional, Util

    def initialize(attributes = {})
      if attributes.is_a?(Hash)
        (required_attributes + optional_attributes).each do |key|
          value = if numeric_attribute?(key)
            Util.to_numeric(attributes[key])
          else
            attributes[key]
          end
          self.send "#{key}=", value
        end
      end
      attr_missing!
    end

    def authenticate(email, password, agb=false, waive_cancelation=false)
      @authenticator = Authenticator.new(email, password, agb, waive_cancelation)
    end

    def send_letter
      if @authenticator
        # create letter
        builder = XMLBuilder.new
      else
        # authenticate first!
      end
    end

    private

  end
end