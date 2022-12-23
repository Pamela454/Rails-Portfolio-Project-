# -*- encoding: utf-8 -*-
# stub: erb-formatter 0.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "erb-formatter".freeze
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/nebulab/erb-formatter/releases", "homepage_uri" => "https://github.com/nebulab/erb-formatter#readme", "source_code_uri" => "https://github.com/nebulab/erb-formatter" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Elia Schito".freeze]
  s.bindir = "exe".freeze
  s.date = "2022-04-07"
  s.email = ["elia@schito.me".freeze]
  s.executables = ["erb-format".freeze, "erb-formatter".freeze]
  s.files = ["exe/erb-format".freeze, "exe/erb-formatter".freeze]
  s.homepage = "https://github.com/nebulab/erb-formatter#readme".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6.0".freeze)
  s.rubygems_version = "3.3.7".freeze
  s.summary = "Format ERB files with speed and precision.".freeze

  s.installed_by_version = "3.3.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<rufo>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rufo>.freeze, [">= 0"])
  end
end
