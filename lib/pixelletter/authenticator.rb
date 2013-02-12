module Pixelletter
  class Authenticator
    def initialize(email, password, agb, widerrufsverzicht)
      @email = email
      @password = password
      @agb = agb
      @widerrufsverzicht = waive_cancelation
    end
  end
end
