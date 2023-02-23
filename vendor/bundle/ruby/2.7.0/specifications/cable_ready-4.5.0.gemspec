# -*- encoding: utf-8 -*-
# stub: cable_ready 4.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "cable_ready".freeze
  s.version = "4.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nathan Hopkins".freeze]
  s.date = "2021-01-26"
  s.email = ["natehop@gmail.com".freeze]
  s.homepage = "https://github.com/hopsoft/cable_ready".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.2".freeze
  s.summary = "Out-of-Band Server Triggered DOM Operations".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rails>.freeze, [">= 5.2"])
    s.add_runtime_dependency(%q<thread-local>.freeze, [">= 1.1.0"])
    s.add_development_dependency(%q<github_changelog_generator>.freeze, [">= 0"])
    s.add_development_dependency(%q<magic_frozen_string_literal>.freeze, [">= 0"])
    s.add_development_dependency(%q<pry>.freeze, [">= 0"])
    s.add_development_dependency(%q<pry-nav>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<standardrb>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rails>.freeze, [">= 5.2"])
    s.add_dependency(%q<thread-local>.freeze, [">= 1.1.0"])
    s.add_dependency(%q<github_changelog_generator>.freeze, [">= 0"])
    s.add_dependency(%q<magic_frozen_string_literal>.freeze, [">= 0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<pry-nav>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<standardrb>.freeze, [">= 0"])
  end
end
