$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "enju_barcode/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "enju_barcode"
  s.version     = EnjuBarcode::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of EnjuBarcode."
  s.description = "TODO: Description of EnjuBarcode."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.1.rc1"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
