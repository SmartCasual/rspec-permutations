require_relative "lib/rspec/permutations/version"

Gem::Specification.new do |spec|
  spec.name          = "rspec-permutations"
  spec.version       = Rspec::Permutations::VERSION
  spec.authors       = ["Elliot Crosby-McCullough"]
  spec.email         = ["elliot.cm@gmail.com"]

  spec.summary       = "An experimental RSpec extension for test permutations."
  spec.homepage      = "https://github.com/SmartCasual/rspec-permutations"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/SmartCasual/rspec-permutations/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.12"
  spec.add_development_dependency "rubocop", "~> 1.39"
  spec.add_development_dependency "rubocop-rake", "~> 0.6"
  spec.add_development_dependency "rubocop-rspec", "~> 2.15"
  spec.metadata["rubygems_mfa_required"] = "true"
end
