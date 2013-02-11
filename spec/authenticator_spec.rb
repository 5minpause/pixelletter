require 'spec_helper'

describe Pixelletter::Authenticator do

  let :attributes do
    {
      email:             'test@ikusei.de',
      password:          'password',
      agb:                true,
      waive_cancelation: true
    }
  end

  let :instance do
    Authenticator.new attributes
  end

  it "should authenticate with pixelletter.de" do
    auth = mock(Authenticator)
    auth.stub(:initialize).and_return(auth)


  end
end