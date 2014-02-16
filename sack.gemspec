# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sack'

Gem::Specification.new do |spec|
  spec.name          = "sack"
  spec.version       = Sack::VERSION
  spec.authors       = ["Zander Hill"]
  spec.email         = ["Zander@civet.ws"]
  spec.summary       = %q{Sack is a ruby rewrite of a sack.sh}
  spec.description   = %q{Sack shortens the searching and editing process.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
