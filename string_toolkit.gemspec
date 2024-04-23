# frozen_string_literal: true

require_relative "lib/string_toolkit/version"

Gem::Specification.new do |spec|
  spec.name = "string_toolkit"
  spec.version = StringToolkit::VERSION
  spec.authors = ["Theodor Weinreich"]
  spec.email = ["weinreichth@gmail.com"]

  spec.summary = "Extends the Ruby String class with useful methods "
  spec.homepage = "https://github.com/toastheo/string-toolkit"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/toastheo/string-toolkit"
  spec.metadata["changelog_uri"] = "https://github.com/toastheo/string-toolkit/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec"
end
