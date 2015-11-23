# -*- encoding: utf-8 -*-
# stub: terminal-notifier-guard 1.5.3 ruby lib

Gem::Specification.new do |s|
  s.name = "terminal-notifier-guard"
  s.version = "1.5.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Eloy Duran", "Wouter de Vos"]
  s.date = "2012-08-14"
  s.email = ["wouter.de.vos@springest.com"]
  s.executables = ["terminal-notifier-notify", "terminal-notifier-success", "terminal-notifier-failed", "terminal-notifier-pending"]
  s.extra_rdoc_files = ["README.markdown"]
  s.files = ["README.markdown", "bin/terminal-notifier-failed", "bin/terminal-notifier-notify", "bin/terminal-notifier-pending", "bin/terminal-notifier-success"]
  s.homepage = "https://github.com/foxycoder/terminal-notifier"
  s.rubygems_version = "2.4.8"
  s.summary = "Send User Notifications on Mac OS X 10.8 - with status icons."

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<bacon>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<mocha-on-bacon>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<bacon>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<mocha-on-bacon>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<bacon>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<mocha-on-bacon>, [">= 0"])
  end
end
