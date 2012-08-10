# -*- encoding: utf-8 -*-
require File.expand_path('../lib/capistrano-http-notify/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["shyndman"]
  gem.email         = ["scotty.hyndman@gmail.com"]
  gem.description   = %q{Sends notification about a successful deploy via an HTTP POST}
  gem.summary       = %q{Sends notification about a successful deploy via an HTTP POST}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "capistrano-http-notify"
  gem.require_paths = ["lib"]
  gem.version       = CapistranoHttpNotify::VERSION
end
