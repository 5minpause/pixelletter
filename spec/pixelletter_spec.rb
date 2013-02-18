require 'spec_helper'

describe Pixelletter do
  context "with CREDENTIALS FILE" do
    before do
      if File.exists?(File.join(File.dirname('../'), "CREDENTIALS"))
        system("mv #{File.join(File.dirname('../'), "CREDENTIALS")} #{File.join(File.dirname('../'), "CREDENTIALS.bak")}")
      end
      f = File.join(File.dirname('../'), "CREDENTIALS")
      File.open(f, 'w') { |file| file.write("email: test@test.de\npassword: testpass") }
      f = File.join(File.dirname('../'), "CREDENTIALS")
      yml = YAML.load(open(f))
      ENV['EMAIL'] = yml['email']
      ENV['PASSWORD'] = yml['password']
    end

    it "should set the correct ENV variables" do
      ENV['EMAIL'].should eq('test@test.de')
      ENV['PASSWORD'].should eq('testpass')
    end

    after do
      if File.exists?(File.join(File.dirname('../'), "CREDENTIALS.bak"))
        system("mv #{File.join(File.dirname('../'), "CREDENTIALS.bak")} #{File.join(File.dirname('../'), "CREDENTIALS")}")
        Pixelletter.load_initial_values
      end
    end
  end

  context 'without CREDENTIALS file' do
    before do
      if File.exists?(File.join(File.dirname('../'), "CREDENTIALS"))
        system("mv #{File.join(File.dirname('../'), "CREDENTIALS")} #{File.join(File.dirname('../'), "CREDENTIALS.bak")}")
      end
      Pixelletter.load_initial_values
    end

    it "should set the correct ENV variables" do
      ENV['EMAIL'].should eq(nil)
      ENV['PASSWORD'].should eq(nil)
    end

    after do
      if File.exists?(File.join(File.dirname('../'), "CREDENTIALS.bak"))
        system("mv #{File.join(File.dirname('../'), "CREDENTIALS.bak")} #{File.join(File.dirname('../'), "CREDENTIALS")}")
        Pixelletter.load_initial_values
      end
    end
  end

  describe 'ENDPOINT' do
    it "should have a production value" do
      Pixelletter.endpoint.should eq('https://www.pixelletter.de/xml/index.php')
    end

    it "should be possible to activate the sandbox" do
      Pixelletter.sandbox?.should eq(false)
      Pixelletter.sandbox!
      Pixelletter.sandbox?.should eq(true)
    end

    context 'while sandboxing' do
      before do
        Pixelletter.sandbox = true
      end

      it "should give an empty value" do
        Pixelletter.endpoint.should eq('http://www.fakeweb.test')
      end
    end
  end
end