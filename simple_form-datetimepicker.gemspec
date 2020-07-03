$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "simple_form/datetimepicker/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple_form-datetimepicker"
  s.version     = SimpleForm::Datetimepicker::VERSION
  s.authors     = ["Roberto Vasquez Angel"]
  s.email       = ["roberto@vasquez-angel.de"]
  s.homepage    = "https://github.com/robotex82/simple_form-datetimepicker"
  s.summary     = "Date(time)picker for Simple Form"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 5.0.0"
  s.add_dependency 'coffee-rails'
  s.add_dependency 'momentjs-rails' #, '>= 2.9.0'
  s.add_dependency 'bootstrap3-datetimepicker-rails' #, '~> 4.17.47'

  s.add_development_dependency "sqlite3"
end
