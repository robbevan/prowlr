# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{prowlr}
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Rob Bevan"]
  s.date = %q{2009-07-13}
  s.default_executable = %q{prowlr}
  s.email = %q{robbevan@xpt.com}
  s.executables = ["prowlr"]
  
  s.add_dependency "httparty"
  s.extra_rdoc_files = [
    "LICENSE",
     "README.md"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.md",
     "Rakefile",
     "VERSION",
     "bin/prowlr",
     "examples/add.rb",
     "examples/add_instance.rb",
     "examples/helpers/config_store.rb",
     "examples/remaining_calls.rb",
     "examples/reset_date.rb",
     "examples/valid_apikey.rb",
     "examples/verify.rb",
     "lib/prowlr.rb",
     "prowlr.gemspec",
     "test/fixtures/bad_request.xml",
     "test/fixtures/invalid_apikey.xml",
     "test/fixtures/success.xml",
     "test/prowlr_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/robbevan/prowlr}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{Yet another Prowl API gem and command line interface}
  s.test_files = [
    "test/prowlr_test.rb",
     "test/test_helper.rb",
     "examples/add.rb",
     "examples/add_instance.rb",
     "examples/helpers/config_store.rb",
     "examples/remaining_calls.rb",
     "examples/reset_date.rb",
     "examples/valid_apikey.rb",
     "examples/verify.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
