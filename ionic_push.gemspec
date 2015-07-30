$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'ionic_push/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'ionic_push'
  s.version     = IonicPush::VERSION
  s.authors     = ['Nicholas W. Watson']
  s.email       = ['nicholas.w.watson@me.com']
  s.homepage    = 'https://github.com/nwwatson/ionic_push'
  s.summary     = 'Simple gem that provides easy access to Ionic.io Push Notification servcie'
  s.description = 'Simple gem that provides easy access to Ionic.io Push Notification servcie'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.2.1'
  s.add_dependency 'httparty', '~> 0.13.5'

  s.add_development_dependency 'sqlite3'
end
