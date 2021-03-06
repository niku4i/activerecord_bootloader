# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activerecord_bootloader/version'

Gem::Specification.new do |spec|
  spec.name          = "activerecord_bootloader"
  spec.version       = ActiverecordBootloader::VERSION
  spec.authors       = ["Nobuhiro Nikushi"]
  spec.email         = ["nikushi.nobuhiro@dena.jp"]
  spec.description   = %q{Bootloads your non-rails app ease.}
  spec.summary       = %q{Taks care of the common tasks connection initializing and db:migrate.}

  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", "~> 4.0.0"
  spec.add_dependency "activesupport", "~> 4.0.0"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
