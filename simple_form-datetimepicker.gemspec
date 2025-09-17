$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "simple_form/datetimepicker/version"

Gem::Specification.new do |spec|
  spec.name        = "simple_form-datetimepicker"
  spec.version     = SimpleForm::Datetimepicker::VERSION
  spec.authors     = [ "BeeGood IT" ]
  spec.email       = [ "info@beegoodit.de" ]
  spec.homepage    = "https://github.com/robotex82/simple_form-datetimepicker"
  spec.summary     = "Date(time)picker for Simple Form"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 8.0"
  spec.add_dependency "simple_form"
  spec.add_dependency "momentjs-rails"
  spec.add_dependency "bootstrap3-datetimepicker-rails"

  spec.add_development_dependency "guard-bundler"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "bootsnap"
  spec.add_development_dependency "pry-rails"
  spec.add_development_dependency "capybara"
  spec.add_development_dependency "sqlite3", "~> 2.1"
end
