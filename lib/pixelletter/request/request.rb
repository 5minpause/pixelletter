module Pixelletter
   class Request < Base
    attr_required :email, :password, :agb, :widerrufsverzicht, :testmodus

    def initialize(attributes = {})
      super
    end

    def request(order, file=nil)
      xml = build_xml(order)
      xml_file = File.join(File.dirname('../'), "pixml.xml")
      File.open(xml_file, 'w') { |file| file.write(xml) }
      upload = File.new(File.join(File.dirname('../'), "pixml.xml"), 'rb')

      if file
        response = handle_response do
          RestClient.post(endpoint, xml: upload, "uploadfile0" => file)
        end
      else
        response = handle_response do
          RestClient.post(endpoint, xml: upload)
        end
      end

      File.delete(File.join(File.dirname('../'), "pixml.xml"))
      return response
    end

    private
    def auth
      {auth:
        {
          email: self.email,
          password: self.password,
          agb: self.agb,
          widerrufsverzicht: self.widerrufsverzicht,
          testmodus: self.testmodus
        }
      }
    end

    def build_xml(order)
      b = XMLBuilder.new
      return b.create_xml(auth, order)
    end

    def handle_response
      response = yield
      @doc = Nokogiri::XML(response)
      value = @doc.xpath('//result').attr("code").value
      msg = @doc.xpath('//msg').first.child.content if @doc.xpath('//msg').any?
      id = @doc.xpath('//id').first.child.content if @doc.xpath('//id').any?
      return {
        value: value,
        msg: msg,
        id: id
      }
    end

    def endpoint
      Pixelletter.endpoint
    end
  end
end