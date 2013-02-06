Gem::Specification.new do |s|
  s.name        = 'pixelletter'
  s.version     = '0.0.1'
  s.date        = '2013-02-06'
  s.summary     = "A gem to use the pixelletter.de API"
  s.description = "A simple gem to use the pixelletter.de API as there exists only an aweful PHP class yet."
  s.authors     = ["Holger Frohloff"]
  s.email       = 'holger@5minutenpause.com'
  s.files       = ["lib/authenticator.rb"]
  s.homepage    ='http://rubygems.org/gems/pixelletter'
  s.add_runtime_dependency "builder", ["~> 3.1.4"]
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec-rails'
end