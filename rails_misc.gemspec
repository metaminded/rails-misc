$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_misc/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_misc"
  s.version     = RailsMisc::VERSION
  s.authors     = ["The metaminded Team"]
  s.email       = ["team@metaminded.com"]
  s.summary     = "Some stuff we need in several places"
  s.description = "Some Stuff we need in several Rails Apps"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.textile"]

  s.add_dependency "rails", "~> 3.2.1"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
