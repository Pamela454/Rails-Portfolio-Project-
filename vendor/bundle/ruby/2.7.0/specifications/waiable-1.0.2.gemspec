# -*- encoding: utf-8 -*-
# stub: waiable 1.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "waiable".freeze
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Sanghapal Bhowate".freeze, "Shantanu Choudhury".freeze]
  s.date = "2015-07-07"
  s.description = "Accessible rails form by including aria properties in rails form helper classes.".freeze
  s.email = ["sangha@techvision.net.in".freeze, "shantanu@techvision.net.in".freeze, "developer@techvision.net.in".freeze]
  s.homepage = "https://github.com/techvision/waiable".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.2".freeze
  s.summary = "Making rails accessible !".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<rails>.freeze, [">= 0"])
  else
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_dependency(%q<rails>.freeze, [">= 0"])
  end
end
