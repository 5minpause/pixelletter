Pixelletter
===========

A simple gem to use the API @ pixelletter.de  
  
This gem is not affiliated with http://www.pixelletter.de and not supported by them.  

Pixelletter is a small SaaS from Germany. You can use it to send letters. Yay!
They currently only offer a curl and PHP example usage scenario. I hate PHP and I don't use curl from my Ruby code.  
That's why I created this small gem.

It is a very rough draft. You cannot use the upload they offer.  
That means you have to provide all content via an xml file which the gem creates for you. Just hand the   
content as a hash.  

Future versions might provide a more OO approach to creating orders.

# Install  

`gem install pixelletter`

# Requirements

* You need an account at [pixelletter.de](http://www.pixelletter.de)
* Edit the file `CREDENTIALS.example` and enter your credentials.

# Usage

Initialize a Pixelletter::Request:
`my_request = Pixelletter::Request.new(email: ENV['EMAIL'], password: ENV['PASSWORD'], agb: true, widerrufsrecht: true))`
You can pass an optional attribute: `testmodus: true`. This makes sure no actual orders are created and you are not billed.  


Create an order hash:
```
order: { order:
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
```

Start a request with this order:
`my_request.request(order)`


# Meta
Created by Holger Frohloff  
Released under the MIT License: [www.opensource.org/licenses/mit-license.php](www.opensource.org/licenses/mit-license.php)

