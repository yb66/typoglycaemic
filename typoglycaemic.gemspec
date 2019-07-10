
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "typoglycaemic/version"

Gem::Specification.new do |spec|
  spec.name          = "Typoglycaemic"
  spec.version       = Typoglycaemic::VERSION
  spec.authors       = ["iain barnett"]
  spec.email         = ["helpful-iain@theprintedbird.com"]
  spec.summary       = %q{An implementation of typoglycaemic word jumbling. Yu'oll hvae no difficltuy raeidng tihs, rgiht?}
  spec.description   = %q{Accorindg to a reeascrehr at Cmbairdge Uivnesrtiy, it deso'nt matter in what order the letters in a word are, the only ipmortnat tinhg is that the fisrt and last letter be at the rgiht pacle. The rset can be a toatl mses and you can still raed it wtiouht poblerm. Tihs is bceasue the huamn mnid does not read eevry letter by iteslf but the wrod as a wolhe.}
  spec.homepage      = "https://github.com/yb66/typoglycaemic"

  if spec.respond_to?(:metadata)
    spec.metadata = {
      "homepage_uri"    => spec.homepage,
      "source_code_uri" => "https://github.com/yb66/typoglycaemic",
      "changelog_uri"]  => "https://github.com/yb66/typoglycaemic/blob/master/CHANGELOG.md",
    }
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
end
