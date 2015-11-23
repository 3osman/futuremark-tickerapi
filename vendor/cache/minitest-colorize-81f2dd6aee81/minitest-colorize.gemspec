# -*- encoding: utf-8 -*-
# stub: minitest-colorize 0.0.6.pre ruby lib

Gem::Specification.new do |s|
  s.name = "minitest-colorize"
  s.version = "0.0.6.pre"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Gabriel Sobrinho"]
  s.date = "2015-11-22"
  s.description = "Colorize Minitest output and show failing tests instantly"
  s.email = ["gabriel.sobrinho@gmail.com"]
  s.files = [".gitignore", ".travis.yml", "CHANGELOG", "Gemfile", "MIT-LICENSE", "README.markdown", "Rakefile", "examples/example.png", "examples/success.png", "lib/minitest-colorize.rb", "lib/minitest/colorize.rb", "lib/minitest/colorize/version.rb", "lib/minitest/colorize_plugin.rb", "minitest-colorize.gemspec", "test/minitest_colorize_test.rb", "test/test_helper.rb"]
  s.homepage = "https://github.com/sobrinho/minitest-colorize"
  s.rubygems_version = "2.4.8"
  s.summary = "Colorize Minitest output and show failing tests instantly"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<minitest>, [">= 5.2"])
      s.add_development_dependency(%q<rake>, [">= 0.8.7"])
    else
      s.add_dependency(%q<minitest>, [">= 5.2"])
      s.add_dependency(%q<rake>, [">= 0.8.7"])
    end
  else
    s.add_dependency(%q<minitest>, [">= 5.2"])
    s.add_dependency(%q<rake>, [">= 0.8.7"])
  end
end
