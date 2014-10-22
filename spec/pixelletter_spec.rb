require 'spec_helper'

describe Pixelletter do
  context "with CREDENTIALS FILE" do
    before do
      backup_credentials_file
      set_test_credentials
    end

    it "should set the correct ENV variables" do
      expect(ENV['EMAIL']).to eq('test@test.de')
      expect(ENV['PASSWORD']).to eq('testpass')
    end

    after do
      restore_credentials_backup
    end
  end

  context 'without CREDENTIALS file' do
    before do
      backup_credentials_file
      Pixelletter.load_initial_values
    end

    it "should set the correct ENV variables" do
      expect(ENV['EMAIL']).to eq(nil)
      expect(ENV['PASSWORD']).to eq(nil)
    end

    after do
      restore_credentials_backup
    end
  end

  describe 'ENDPOINT' do
    context 'while in production' do
      before(:each) do
        Pixelletter.sandbox = false
      end
      it "should have a production value" do
        expect(Pixelletter.endpoint).to eq('https://www.pixelletter.de/xml/index.php')
      end

      it "should be possible to activate the sandbox" do
        expect(Pixelletter.sandbox?).to eq(false)
        Pixelletter.sandbox!
        expect(Pixelletter.sandbox?).to eq(true)
      end
    end

    context 'while sandboxing' do
      before do
        Pixelletter.sandbox = true
      end

      it "should give an empty value" do
        expect(Pixelletter.endpoint).to eq('http://www.fakeweb.test')
      end
    end
  end

  private
  def backup_credentials_file
    if File.exists?(File.join(File.dirname('../'), "CREDENTIALS"))
      system("mv #{File.join(File.dirname('../'), "CREDENTIALS")} \
             #{File.join(File.dirname('../'), "CREDENTIALS.bak")}")
    end
  end

  def restore_credentials_backup
    if File.exists?(File.join(File.dirname('../'), "CREDENTIALS.bak"))
      system("mv #{File.join(File.dirname('../'), "CREDENTIALS.bak")} \
             #{File.join(File.dirname('../'), "CREDENTIALS")}")
      Pixelletter.load_initial_values
    end
  end

  def set_test_credentials
    f = File.join(File.dirname('../'), "CREDENTIALS")
    File.open(f, 'w') { |file| file.write("email: test@test.de\npassword: testpass") }
    f = File.join(File.dirname('../'), "CREDENTIALS")
    yml = YAML.load(open(f))
    ENV['EMAIL'] = yml['email']
    ENV['PASSWORD'] = yml['password']
  end
end
