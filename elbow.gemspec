# -*- encoding: utf-8 -*-
require File.expand_path('../lib/elbow/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Stephen Bartlett"]
  gem.email         = ["stephenb@rtlett.org"]
  gem.description   = %q{Capistrano plugin for deploying to an AWS Elastic Load Balancer}
  gem.summary       = %q{Use this gem as a plugin to Capistrano to deploy to EC2 instances behind an Elastic Load Balancer}
  gem.homepage      = "https://github.com/srbartlett/elbow"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "elbow"
  gem.require_paths = ["lib"]
  gem.version       = Elbow::VERSION
  gem.add_dependency('aws-sdk')
  gem.add_dependency('net-dns')

end
