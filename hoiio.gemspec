# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hoiio-ruby/version/version'

Gem::Specification.new do |gem|
  gem.name          = "hoiio"
  gem.version       = Hoiio::VERSION
  gem.authors       = ["Steve Van"]
  gem.email         = ["stevevan@hoiio.com"]
  gem.description   = "This is an SDK for Hoiio API, a set of telephony API that integrate telephony services - phone calls, conference, IVR (Interactive Voice Responses), Fax and SMS - into your services and website easily."
  gem.summary       = "Hoiio SDK for Ruby"
  gem.homepage      = "https://github.com/icarusK/hoiio-ruby"

  gem.files         = `git ls-files -- lib/*`.split("\n")
  gem.files        += %w[README.md LICENSE.txt]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = Dir['spec/**/*.rb']
  gem.require_paths = %w[lib]

  gem.add_runtime_dependency(%q<json>, ["> 1.4.0"])
  gem.add_runtime_dependency(%q<httparty>, ["> 0.6.0"])

  gem.add_development_dependency 'rake',    '~> 0.9.0'
  gem.add_development_dependency 'rspec',   '~> 2.6.0'
  gem.add_development_dependency 'fakeweb', '~> 1.3.0'

  gem.extra_rdoc_files = ['README.md', 'LICENSE.txt']
  gem.rdoc_options = ['--line-numbers', '--inline-source', '--title', 'hoiio-ruby', '--main', 'README.md']

end
