lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)


Gem::Specification.new do |spec|
  spec.name          = "fluent-plugin-fortigate-syslog-parser"
  spec.version       = "0.1.1"
  spec.authors       = ["Ilie Cazangiu "]
  spec.email         = ["ilie.cazangiu@yahoo.co.uk"]

  spec.summary       = %q{Parser for Fortigate syslog.}
  spec.description   = %q{Fortigate syslog fails the standard check when using the standard syslog input plugin. This was designed and tested to work on Fortigate 100D}
  spec.homepage      = "https://github.com/iliecz/fluent-plugin-fortigate-syslog-parser"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/iliecz/fluent-plugin-fortigate-syslog-parser"
  spec.metadata["changelog_uri"] = "https://github.com/iliecz/fluent-plugin-fortigate-syslog-parser"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end