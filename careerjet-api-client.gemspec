require File.expand_path('../lib/careerjet/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name = 'careerjet-api-client'
  gem.version = Careerjet.version
  gem.description = "Ruby wrapper for Careerjet's API"
  gem.summary = "Ruby wrapper for Careerjet's API"
  gem.homepage = 'https://github.com/careerjet/careerjet-api-client-ruby'
  gem.authors = ['Sergey Efremov', 'Kostiantyn Kahanskyi','Careerjet']
  gem.email = %w[efremov.sergey@gmail.com kostiantyn.kahanskyi@googlemail.com,'thomas@careerjet.com']
  gem.license = 'MIT'
  gem.files = `git ls-files`.split("\n")
  gem.require_paths = %w[lib]
  gem.add_dependency 'multi_json'
  gem.add_dependency 'rest-client'
  gem.add_dependency 'hashie'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'yajl-ruby' # To avoid warning from MultiJson
end
