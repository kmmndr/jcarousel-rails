$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "jcarousel/rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "jcarousel-rails"
  s.version     = JcarouselRails::VERSION
  s.authors     = ["Dan Garland"]
  s.email       = ["dan@dangarland.co.uk"]
  s.homepage    = "http://www.dangarland.co.uk"
  s.summary     = "JCarousel packaged for Rails 3 asset pipeline"
  s.description = "JCarousel packaged for Rails 3 asset pipeline"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "> 3.2.14"
  s.add_dependency "jquery-rails"

end
