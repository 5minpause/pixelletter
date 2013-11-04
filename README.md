Pixelletter
===========
[![Code
Climate](https://codeclimate.com/github/jazzgumpy/pixelletter.png)](https://codeclimate.com/github/jazzgumpy/pixelletter)
[![Dependency
Status](https://gemnasium.com/jazzgumpy/pixelletter.png)](https://gemnasium.com/jazzgumpy/pixelletter)
[![Build
Status](https://travis-ci.org/jazzgumpy/pixelletter.png)](https://travis-ci.org/jazzgumpy/pixelletter)

A simple gem to use the API @ pixelletter.de

This gem is not affiliated with http://www.pixelletter.de and not supported by them.

Pixelletter is a small SaaS from Germany. You can use it to send letters. Yay!
They currently only offer a curl and PHP example usage scenario. I hate PHP and I don't use curl from my Ruby code.
That's why I created this small gem.

It is still an early version.
That means you have to provide all content via an xml file which the gem creates for you. Just hand the
content as a hash or attach a file (e.g. a pdf file).

Future versions might provide a more OO approach to creating orders.

# Install

```
gem install pixelletter
```

# Requirements

* You need an account at [pixelletter.de](http://www.pixelletter.de)
* Edit the file `CREDENTIALS.example` and enter your credentials.
* Save it as CREDENTIALS

# Usage

Initialize a Pixelletter::Request:
```
my_request = Pixelletter::Request.new(email: ENV['EMAIL'], password: ENV['PASSWORD'], agb: true, widerrufsrecht: true))
```
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
```
my_request.request(order)
```

If you want to send a pdf file as letter do this:
```
pdf_file = File.new(File.join('path', 'to', 'my_letter.pdf'))
my_request.request(order, pdf_file)
```

# Note on Patches/Pull Requests

* Fork the project.
* Setup your development environment with: gem install bundler; bundle install
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.


# Meta
Created by Holger Frohloff

Released under the MIT License: [www.opensource.org/licenses/mit-license.php](www.opensource.org/licenses/mit-license.php)



[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/5minpause/pixelletter/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

