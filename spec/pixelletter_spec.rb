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
        f = File.join(File.dirname('../'), "CREDENTIALS")
        yml = YAML.load(open(f))
        ENV['EMAIL'] = yml['email']
        ENV['PASSWORD'] = yml['password']
      end
    end
  end
end