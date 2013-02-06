class Authenticator
  def initialize(email, password, agb=false, waive_cancelation=false)
    @email = email
    @password = password
    @agb = agb
    @waive_cancelation = waive_cancelation
  end
end