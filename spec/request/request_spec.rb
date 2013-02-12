# Encoding: UTF-8
require 'spec_helper'

describe Pixelletter::Request do

  let :attributes do
    {
      email:             ENV['EMAIL'],
      password:          ENV['PASSWORD'],
      agb:                true,
      widerrufsverzicht:  true,
      testmodus:          true
    }
  end

  describe '.new' do
    context 'when any required parameters are missing' do
      it 'should raise AttrRequired::AttrMissing' do
        attributes.keys.each do |missing_key|
          insufficient_attributes = attributes.reject do |key, value|
            key == missing_key
          end
          expect do
            Pixelletter::Request.new(insufficient_attributes)
          end.to raise_error AttrRequired::AttrMissing
        end
      end
    end

    context 'when all required parameters are given' do
      it 'should succeed' do
        expect do
          Pixelletter::Request.new(attributes)
        end.not_to raise_error AttrRequired::AttrMissing
      end
    end
  end

  describe '#request' do
    context 'with text' do
      let :order do
        { order:
          {
            options: {
              type: 'text',
              action: 1,
              destination: 'DE'
            },
            text: {
              address: "Erika Mustermann\nMusterstr. 2\nD-81237 Musterstadt",
              subject: 'Das ist der Betreff',
              message: 'Das ist die Nachricht.'
            }
          }
        }
      end

      # <?xml version="1.0" encoding="UTF-8"?>
      # <pixelletter version="1.1">
      #   <response>
      #     <result code="100">
      #       <msg>Auftrag erfolgreich übermittelt.</msg>
      #       <id>11954460</id>
      #     </result>
      #   </response>
      # </pixelletter>

      it "should send a successful request" do
        # order = Pixelletter::TextOrder.new()
        pr = mock(Pixelletter::Request.new(attributes))
        pr.stub(:request).with(order).and_return({:value=>"100", :msg=>"Auftrag erfolgreich übermittelt.", :id=>"11954536"})
        response = pr.request(order)
        response[:value].should == '100'
      end
    end

    context 'with upload' do
      let :order do
        { order:
          {
            options: {
              type: 'upload',
              action: 1,
              destination: 'DE'
            }
          }
        }
      end

      it "should send a successful request" do
        pr = Pixelletter::Request.new(attributes)
        # pr.stub(:request).with(order).and_return({:value=>"100", :msg=>"Auftrag erfolgreich übermittelt.", :id=>"11954536"})
        response = pr.request(order)
        puts response.inspect
        # response[:value].should == '100'
      end
    end
  end
end