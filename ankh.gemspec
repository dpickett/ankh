# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ankh/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dan Pickett"]
  gem.email         = ["dpickett@enlightsolutions.com"]
  gem.description   = %q{Protect against bots and other spam producers}
  gem.summary       = %q{Asks simple randomized questions to detect humans}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "ankh"
  gem.require_paths = ["lib"]
  gem.version       = Ankh::VERSION

  gem.add_dependency "activesupport", "> 3.0"
  gem.add_dependency "configatron"

  gem.add_development_dependency "sqlite3"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rails"
  gem.add_development_dependency "rspec", "> 1.2.9"
  gem.add_development_dependency "mocha"
end

