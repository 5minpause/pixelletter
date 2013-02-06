require 'builder'

class XMLBuilder

  def create_xml
    xml = Builder::XmlMarkup.new( :indent => 2 )
    xml.instruct! :xml, :encoding => "UTF-8"
    return xml
  end

  # private
  # # Creates the <auth> block for the xml
  # def connect(email, password, agb=false, waive_cancelation=false)
  #   authenticator = Authenticator.new(email, password)
  #   xml.auth do |p|
  #     p.name "Test"
  #   end

  # end

  # # Creates the <options> block for the xml
  # def make_options(type='text', action='1', destination='DE')

  # end

  # # Creates the <text> block for the xml
  # def make_text(address=nil, subject=nil, message=nil)

  # end

  # # Creates the <order> block for the xml
  # def make_order
  #   auth_block = connect()

  # end

end