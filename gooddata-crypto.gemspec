
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gooddata/crypto/version"

Gem::Specification.new do |spec|
  spec.name          = "gooddata-crypto"
  spec.version       = Gooddata::Crypto::VERSION
  spec.authors       = ["Petr Gadorek"]
  spec.email         = ["petr.gadorek@gooddata.com"]

  spec.summary       = "Sipmle library for encryption/decryption of string"
  spec.description   = "This gem uses openssl to encrypt or decrypt string based on key"
  spec.homepage      = "https://github.com/gooddata/gooddata-ruby-decrypt"
  spec.license       = "BSD"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'rspec_junit_formatter', '~> 0.3.0'
  spec.add_development_dependency 'pry'
end
