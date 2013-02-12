require 'spec_helper'

describe Pixelletter::Request do

  let :attributes do
    {
      email:             'test@ikusei.de',
      password:          'password',
      agb:                true,
      widerrufsverzicht:  true
    }
  end

  let :instance do
    Authenticator.new attributes
  end

  describe '.new' do
    context 'when any required parameters are missing' do
      it 'should raise AttrRequired::AttrMissing' do
        attributes.keys.each do |missing_key|
          insufficient_attributes = attributes.reject do |key, value|
            key == missing_key
          end
          expect do
            Pixelletter::Request.new insufficient_attributes
          end.to raise_error AttrRequired::AttrMissing
        end
      end
    end

    context 'when all required parameters are given' do
      it 'should succeed' do
        expect do
          Pixelletter::Request.new attributes
        end.not_to raise_error AttrRequired::AttrMissing
      end
    end
  end

  describe '#request' do
    it "should send a successful request" do
      pr = Pixelletter::Request.new attributes
      res = pr.request
      puts ENV.inspect
      # EMAIL.should == 'info@ikusei.de'
      puts res.inspect
      # response.status_code.should == 302
    end
  end
end