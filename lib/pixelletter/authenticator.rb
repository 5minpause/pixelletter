module Pixelletter
  class Authenticator
    def initialize(email, password, agb, waive_cancelation)
      @email = email
      @password = password
      @agb = agb
      @waive_cancelation = waive_cancelation
    end
  end
end
