# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sprockets_spacely/version"

Gem::Specification.new do |s|
  s.name        = "sprockets_spacely"
  s.version     = SprocketsSpacely::VERSION
  s.authors     = ["Outright"]
  s.email       = [""]
  s.homepage    = ""
  s.summary     = %q{Even lighter-weight way to get Mustache.js into your Sprockets. Entirely influenced by Ryan Dy's '}
  s.description = %q{ Mr.Spacely, of Spacely Sprockets, Inc. had a mustache: http://www.google.com/search?q=mr.+spacely&hl=en&prmd=imvns&tbm=isch&tbo=u&source=univ&sa=X&ei=YI2wTpafH9PPiALHnIAF&ved=0CD0QsAQ&biw=1080&bih=1282&sei=%20jY6wTsr-CsSmiQKg0Tw}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rails"
  s.add_dependency "tilt"

  s.add_development_dependency "rspec"

end
