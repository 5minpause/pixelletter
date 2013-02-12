require 'builder'

module Pixelletter
  class XMLBuilder < Base

    def initialize
      super
    end


    #
    # args = [ {:auth => { email: 'email@email.de', password: 'password', ... }},
    #          {:options => { ... }}
    #         ]
    #
    #
    def create_xml(*args)
      xml = Builder::XmlMarkup.new( :indent => 2 ); false
      xml.instruct! :xml, :encoding => "UTF-8"
      xml.tag! "pixelletter", version: '1.0' do
        args.flatten.each do |element|
          xml = build_subparts(xml, element)
        end
      end
      finalize_xml(xml)
    end

    private

    def build_subparts(xml, element)
      element.each do |key, value|
        if value.class == Hash
          xml.tag! key do
            build_subparts(xml, value)
          end
        else
          # Der Tag <testmodus> erwartet einen Boolean Wert, deshalb kein parsen.
          if key.to_s == 'testmodus'
            xml.tag! key, value
          else
            xml.tag! key, parse(value)
          end
        end
      end
      return xml
    end

    def parse(value)
      if value == true
        'ja'
      elsif value == false
        'nein'
      else
        "#{value}"
      end
    end

    def finalize_xml(xml)
      return xml.target!
    end
  end
end
