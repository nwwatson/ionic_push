$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ionic_push/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ionic_push"
  s.version     = IonicPush::VERSION
  s.authors     = ["Nicholas W. Watson"]
  s.email       = ["nicholas.w.watson@me.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of IonicPush."
  s.description = "TODO: Description of IonicPush."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
end
