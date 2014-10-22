# encoding: utf-8

Gem::Specification.new do |s|
  s.name        = 'pixelletter'
  s.version     = File.read(File.join(File.dirname(__FILE__), "VERSION"))
  s.date        = Time.now.strftime("%Y-%m-%d")
  s.summary     = "A gem to use the pixelletter.de API"
  s.description = "A simple gem to use the pixelletter.de API."
  s.authors     = ["Holger Frohloff"]
  s.email       = 'holger@5minutenpause.com'
  s.files       = [
    'CREDENTIALS.example',
    'Rakefile',
    'README.md',
    'VERSION',
    'lib/pixelletter.rb',
    'lib/pixelletter/base.rb',
    'lib/pixelletter/request/request.rb',
    'lib/pixelletter/request/xml_builder.rb',
    'spec/spec_helper.rb',
    'spec/pixelletter_spec.rb',
    'spec/request/request_spec.rb',
    'spec/request/xml_builder_spec.rb'
  ]
  s.homepage    ='https://github.com/jazzgumpy/pixelletter'
  s.add_dependency "activesupport"
  s.add_dependency "attr_required"
  s.add_dependency "nokogiri"
  s.add_dependency "rest_client"
  s.add_runtime_dependency "builder", ["~> 3.2"]
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'test_xml'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'rb-fsevent', ['~> 0.9']
  s.add_development_dependency 'fakeweb'
end
