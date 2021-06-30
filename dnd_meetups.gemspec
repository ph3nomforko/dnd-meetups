# frozen_string_literal: true

require_relative "lib/dnd_meetups/version"

Gem::Specification.new do |spec|
  spec.name          = "dnd_meetups"
  spec.version       = DNDMeetups::VERSION
  spec.authors       = ["Codi Kraus"]
  spec.email         = ["codi.kraus@gmail.com"]

  spec.summary       = "Scrape Roll20 for upcoming online Dungeons & Dragons games. Provide a list of the games and allow user to select a game and learn more about it."
  spec.homepage      = "https://github.com/ph3nomforko/dnd-meetups.git"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ph3nomforko/dnd-meetups.git"
  spec.metadata["changelog_uri"] = "https://github.com/ph3nomforko/dnd-meetups.git"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
