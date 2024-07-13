# frozen_string_literal: true

require_relative 'lib/mercadona/version'

Gem::Specification.new do |spec|
  spec.name = 'mercadona'
  spec.version = Mercadona::VERSION
  spec.authors = ['Vladislav Trotsenko']
  spec.email = ['admin@bestweb.com.ua']

  spec.summary = %(Simple retail shop interface)
  spec.description = %(Simple retail shop interface.)

  spec.homepage = 'https://github.com/bestwebua/mercadona'
  spec.license = 'MIT'

  spec.metadata = {
    'homepage_uri' => 'https://github.com/bestwebua/mercadona',
    'changelog_uri' => 'https://github.com/bestwebua/mercadona/blob/master/CHANGELOG.md',
    'source_code_uri' => 'https://github.com/bestwebua/mercadona',
    'documentation_uri' => 'https://github.com/bestwebua/mercadona/blob/master/README.md',
    'bug_tracker_uri' => 'https://github.com/bestwebua/mercadona/issues'
  }

  spec.required_ruby_version = '>= 2.7.0'
  spec.files = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(bin|lib)/|.ruby-version|mercadona.gemspec|LICENSE}) }
  spec.require_paths = %w[lib]

  spec.add_development_dependency 'factory_bot', '~> 6.4', '>= 6.4.4'
  spec.add_development_dependency 'rake', '~> 13.2', '>= 13.2.1'
  spec.add_development_dependency 'rspec', '~> 3.13'
end
