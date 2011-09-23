$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "enju_barcode/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "enju_barcode"
  s.version     = EnjuBarcode::VERSION
  s.authors     = ["Kosuke Tanabe"]
  s.email       = ["tanabe@mwr.mediacom.keio.ac.jp"]
  s.homepage    = "https://github.com/nabeta/enju_barcode"
  s.summary     = "enju_barcode plugin"
  s.description = "barcode generator for Next-L Enju"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "=> 3.0.10"

  s.add_development_dependency "sqlite3"
end
