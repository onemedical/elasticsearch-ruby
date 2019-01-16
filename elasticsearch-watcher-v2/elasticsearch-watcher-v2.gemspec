# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'elasticsearch_v2/watcher/version'

Gem::Specification.new do |s|
  s.name          = "elasticsearch-watcher-v2"
  s.version       = ElasticsearchV2::Watcher::VERSION
  s.authors       = ["Karel Minarik"]
  s.email         = ["karel.minarik@elasticsearch.org"]
  s.description   = %q{Ruby Integrations for Elasticsearch Watcher plugin (WIP)}
  s.summary       = s.description
  s.homepage      = ""
  s.license       = "Apache 2"

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_dependency "elasticsearch-api-v2"

  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency "rake", "~> 11.1"

  s.add_development_dependency "elasticsearch-v2"
  s.add_development_dependency "elasticsearch-extensions-v2"

  s.add_development_dependency 'shoulda-context'
  s.add_development_dependency 'activesupport'
  s.add_development_dependency 'turn'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'minitest', '~> 4.0'
  s.add_development_dependency 'minitest-reporters'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'simplecov-rcov'
  s.add_development_dependency 'yard'
  s.add_development_dependency 'cane'
  s.add_development_dependency 'pry'

  if defined?(RUBY_VERSION) && RUBY_VERSION > '2.2'
    s.add_development_dependency "test-unit", '~> 2'
  end
end
