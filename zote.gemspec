# frozen_string_literal: true

require_relative "lib/zote/version"

Gem::Specification.new do |spec|
  spec.name = "zote"
  spec.version = Zote::VERSION
  spec.authors = ["David Shaffer"]
  spec.email = ["dave.shaffer@gmail.com"]

  spec.summary = "This gem provides the Fifty-Seven Precents Of Zote in a convenient command-line interface."
  spec.homepage = "https://github.com/flanger001/zote"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
