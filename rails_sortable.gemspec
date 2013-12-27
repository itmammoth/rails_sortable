$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_sortable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_sortable"
  s.version     = RailsSortable::VERSION
  s.authors     = ["itmammoth"]
  s.email       = ["itmammoth@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of RailsSortable."
  s.description = "TODO: Description of RailsSortable."

  s.files = Dir["{app,config,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.0.2"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
