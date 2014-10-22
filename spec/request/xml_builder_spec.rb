require 'spec_helper'

describe Pixelletter::XMLBuilder do
  describe '#create_xml' do
    let :auth do
      { auth: {
        email: 'email@email.de',
        password: 'password',
        agb: true,
        widerrufsverzicht: true,
        testmodus: true }
      }
    end

    it 'should create a valid xml with an <auth> block' do
      b = Pixelletter::XMLBuilder.new
      xml = b.create_xml(auth)

      expect(xml).to equal_xml(<<-XML)
        <?xml version="1.0" encoding="UTF-8"?>
        <pixelletter version="1.0">
          <auth>
            <email>email@email.de</email>
            <password>password</password>
            <agb>ja</agb>
            <widerrufsverzicht>ja</widerrufsverzicht>
            <testmodus>true</testmodus>
          </auth>
        </pixelletter>
      XML
    end

    context 'with false as value' do
      let :auth do
        { auth: {
          email: 'email@email.de',
          password: 'password',
          agb: false,
          widerrufsverzicht: false,
          testmodus: true }
        }
      end

      it 'should create a valid xml with an <auth> block' do
        b = Pixelletter::XMLBuilder.new
        xml = b.create_xml(auth)

        expect(xml).to equal_xml(<<-XML)
          <?xml version="1.0" encoding="UTF-8"?>
          <pixelletter version="1.0">
            <auth>
              <email>email@email.de</email>
              <password>password</password>
              <agb>nein</agb>
              <widerrufsverzicht>nein</widerrufsverzicht>
              <testmodus>true</testmodus>
            </auth>
          </pixelletter>
        XML
      end
    end

    let :order do
      { order:
        {
          options: {
            type: 'text',
            action: 1,
            destination: 'DE',
            addoption: '33'
          },
          text: {
            address: "Erika Mustermann\nMusterstr. 2\nD-81237 Musterstadt",
            subject: 'Das ist der Betreff',
            message: 'Das ist die Nachricht.'
          }
        }
      }
    end

    it 'should create a valid xml with an <auth> and an <order> block' do
      b = Pixelletter::XMLBuilder.new
      xml = b.create_xml(auth, order)

      expect(xml).to equal_xml(<<-XML)
<?xml version="1.0" encoding="UTF-8"?>
<pixelletter version="1.0">
  <auth>
    <email>email@email.de</email>
    <password>password</password>
    <agb>ja</agb>
    <widerrufsverzicht>ja</widerrufsverzicht>
    <testmodus>true</testmodus>
  </auth>
  <order>
    <options>
      <type>text</type>
      <action>1</action>
      <destination>DE</destination>
      <addoption>33</addoption>
     </options>
     <text>
      <address>Erika Mustermann
Musterstr. 2
D-81237 Musterstadt</address>
      <subject>Das ist der Betreff</subject>
      <message>Das ist die Nachricht.</message>
     </text>
  </order>
</pixelletter>
      XML
    end
  end
end
