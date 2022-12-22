# -*- encoding: utf-8 -*-
# stub: syntax_tree-rbs 0.5.1 ruby lib

Gem::Specification.new do |s|
  s.name = "syntax_tree-rbs".freeze
  s.version = "0.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "rubygems_mfa_required" => "true" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Kevin Newton".freeze]
  s.bindir = "exe".freeze
  s.date = "2022-09-19"
  s.email = ["kddnewton@gmail.com".freeze]
  s.homepage = "https://github.com/ruby-syntax-tree/syntax_tree-rbs".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.3.7".freeze
  s.summary = "Syntax Tree support for RBS".freeze

  s.installed_by_version = "3.3.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<prettier_print>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<rbs>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<syntax_tree>.freeze, [">= 2.0.1"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
  else
    s.add_dependency(%q<prettier_print>.freeze, [">= 0"])
    s.add_dependency(%q<rbs>.freeze, [">= 0"])
    s.add_dependency(%q<syntax_tree>.freeze, [">= 2.0.1"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
  end
end
