# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'id3global/version'

Gem::Specification.new do |gem|
  gem.name          = "id3global"
  gem.version       = Id3global::VERSION
  gem.authors       = ["Chris Norman"]
  gem.email         = ["chris@norman.me"]
  gem.description   = %q{ID3GLOBAL}
  gem.summary       = %q{ID3GLOBAL}
  gem.homepage      = ""
  
  gem.add_development_dependency "rspec", "~> 2.6"
  gem.add_dependency "savon"
  gem.add_dependency "activesupport"
  gem.add_dependency "rubyntlm"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
