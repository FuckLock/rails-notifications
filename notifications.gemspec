$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "notifications/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails-notifications"
  s.version     = Notifications::VERSION
  s.authors     = ["baodongdongCK"]
  s.email       = ["bao1214063293@gmail.com"]
  s.homepage    = "https://github.com/rails-notifications"
  s.summary     = "rails-notifications."
  s.description = "rails-notifications."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  # s.add_dependency "rails", "~> 5.1.4"
  #
  # s.add_development_dependency "sqlite3"
end
