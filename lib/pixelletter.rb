require 'pixelletter/authenticator'

class Pixelletter
  def connect(email, password)
    authenticator = Authenticator.new(email, password)
  end
end

