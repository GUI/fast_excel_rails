require_relative 'lib/fast_excel_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "fast_excel_rails"
  spec.version       = FastExcelRails::VERSION
  spec.authors       = ["Nick Muerdter"]
  spec.email         = ["12112+GUI@users.noreply.github.com"]

  spec.summary       = %q{A Rails template handler for the fast_excel gem.}
  spec.homepage      = "https://github.com/GUI/fast_excel_rails"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/GUI/fast_excel_rails/tree/v#{FastExcelRails::VERSION}"
  spec.metadata["changelog_uri"] = "https://github.com/GUI/fast_excel_rails/blob/v#{FastExcelRails::VERSION}/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "fast_excel", "~> 0.1"
end
