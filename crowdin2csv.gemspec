# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'crowdin2csv/version'

Gem::Specification.new do |spec|
  spec.name          = 'crowdin2csv'
  spec.version       = Crowdin2csv::VERSION
  spec.authors       = ['takahashim']
  spec.email         = ['takahashimm@gmail.com']

  spec.summary       = 'Crowdin2csv converts xliff file from crowdin.com into CSV file.'
  spec.description   = 'Crowdin2csv converts xliff file from crowdin.com into CSV file.'
  spec.homepage      = 'https://github.com/takahashim/crowdin2csv'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = spec.homepage
    spec.metadata['changelog_uri'] = 'https://github.com/takahashim/crowdin2csv/'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'nokogiri'
  spec.add_development_dependency 'bundler', '>= 2.1'
  spec.add_development_dependency 'minitest', '>= 5.0'
  spec.add_development_dependency 'rake', '>= 13.0'
  spec.add_development_dependency 'rubocop', '>= 1.9.1'
  spec.add_development_dependency 'rubocop-rake'
end
