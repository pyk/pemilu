# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pemilu/version'

Gem::Specification.new do |spec|
  spec.name          = "pemilu"
  spec.version       = Pemilu::VERSION
  spec.authors       = ["Bayu Aldi Yansyah"]
  spec.email         = ["bayualdiyansyah@gmail.com"]
  spec.summary       = %q{A beautiful Ruby interface for Pemilu APIs (pemiluapi.org)}
  spec.description   = %q{A beautiful Ruby interface for Pemilu APIs}
  spec.homepage      = "https://github.com/pyk/pemilu"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
