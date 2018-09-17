lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'selligent/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'selligent'
  s.version     = Selligent::VERSION
  s.authors     = ['Werner Hofstra']
  s.email       = ['w.hofstra@catawiki.nl']
  s.homepage    = 'https://github.com/catawiki/selligent'
  s.summary     = 'Selligent Ruby API client'
  s.description = 'Provides access to the Selligent REST API'
  s.license     = 'proprietary'

  s.files       = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  s.require_paths = ['lib']

  s.add_development_dependency 'bundler', '~> 1.16'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'rspec_junit_formatter', '~> 0.3'
  s.add_development_dependency 'rubocop', '~> 0.5'

  s.add_dependency 'faraday', '>= 0.9.2'
end
