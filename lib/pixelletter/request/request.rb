module Pixelletter
  class Exception < StandardError
  end

  class HttpError < Exception
    attr_accessor :code, :message, :body
    def initialize(code, message, body = '')
      @code = code
      @message = message
      @body = body
    end
  end

  class Request < Base
    attr_required :email, :password, :agb, :widerrufsverzicht

    ENDPOINT = 'https://www.pixelletter.de/xml/index.php'

    def initialize(attributes = {})
      super
    end

    def request
      xml = '<xml><foo>bar</foo></xml>'


      handle_response do
        RestClient.post(ENDPOINT, xml , {:content_type => :xml})
      end
    end

    private

    def auth
      {
        email: self.email,
        password: self.password,
        agb: self.agb,
        widerrufsverzicht: self.widerrufsverzicht
      }
    end

    def build_xml(auth)
      b = XMLBuilder.new
      b.create_xml
    end

    def handle_response
      response = yield
      @doc = Nokogiri::XML(response)
      value = @doc.xpath('//result').attr("code").value
      msg = @doc.xpath('//msg').first.child.content
      id = @doc.xpath('//id')
      return {
        value: value,
        msg: msg,
        id: id
      }

    #   response = CGI.parse(response).inject({}) do |res, (k, v)|
    #     res.merge!(k.to_sym => v.first)
    #   end
    #   case response[:ACK]
    #   when 'Success', 'SuccessWithWarning'
    #     response
    #   else
    #     # raise Exception::APIError.new(response)
    #     # puts response.inspect
    #     # TODO: Error handling
    #     response
    #   end
    # rescue RestClient::Exception => e
    #   raise Exception::HttpError.new(e.http_code, e.message, e.http_body)
    end

  end
end