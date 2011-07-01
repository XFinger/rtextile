# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rtextile/version"

Gem::Specification.new do |s|
  s.name        = "rtextile"
  s.version     = Rtextile::VERSION
  s.authors     = ["Xfinger"]
  s.email       = ["xfinger@gmail.com"]
  s.homepage    = "https://github.com/XFinger/rtextile"
  s.summary     = %q{Rails 3 Textile Editor}
  s.description = %q{ Rails Textile Editor, includes Textile_Editor_Helper plugin files that
    have been upgraded for rails 3 }

  s.rubyforge_project = "rtextile"
  s.add_dependency('RedCloth')

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
