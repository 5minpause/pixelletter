require 'pixelletter/authenticator'
require 'pixelletter/xml_builder'

class Pixelletter

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

