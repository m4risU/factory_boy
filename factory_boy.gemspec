$LOAD_PATH << File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'factory_boy'
  s.version     = '0.0.1'
  s.date        = '2016-01-15'
  s.summary     = "factory_boy is a copy cat for factory girl"
  s.description = "A simple version of factory_girl gem"
  s.authors     = ["Mariusz Wyrozebski"]
  s.email       = 'mariuszwyrozebski@gmail.com'
  s.files       = `git ls-files`.split("\n")
  s.require_path = 'lib'
  s.add_development_dependency("rspec",    "~> 3.4")
  s.required_ruby_version = '~> 1.9.3'
  s.homepage    = 'https://github.com/m4risU/factory_boy'
  s.license     = 'MIT'
end
