# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'teachable/version'

Gem::Specification.new do |gem|
  gem.name          = "teachable"
  gem.version       = Teachable::VERSION
  gem.authors       = ["Jacy"]
  gem.email         = ["jacy.clare@gmail.com"]
  gem.description   = %q{A gem that wraps the Teachable Mock API.}
  gem.summary       = %q{Mock everything, it's a mock API!}

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "faraday"
  gem.add_dependency "json"
end
