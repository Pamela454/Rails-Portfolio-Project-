# -*- encoding: utf-8 -*-
# stub: standalone_migrations 7.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "standalone_migrations".freeze
  s.version = "7.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Todd Huss".freeze, "Michael Grosser".freeze]
  s.date = "2022-03-16"
  s.email = "thuss@gabrito.com".freeze
  s.extra_rdoc_files = ["LICENSE".freeze, "README.markdown".freeze]
  s.files = ["LICENSE".freeze, "README.markdown".freeze]
  s.homepage = "http://github.com/thuss/standalone-migrations".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.1".freeze
  s.summary = "A thin wrapper to use Rails Migrations in non Rails projects".freeze

  s.installed_by_version = "3.0.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>.freeze, [">= 10.0"])
      s.add_runtime_dependency(%q<activerecord>.freeze, [">= 4.2.7", "< 7.1.0", "!= 5.2.3", "!= 5.2.3.rc1"])
      s.add_runtime_dependency(%q<railties>.freeze, [">= 4.2.7", "< 7.1.0", "!= 5.2.3", "!= 5.2.3.rc1"])
    else
      s.add_dependency(%q<rake>.freeze, [">= 10.0"])
      s.add_dependency(%q<activerecord>.freeze, [">= 4.2.7", "< 7.1.0", "!= 5.2.3", "!= 5.2.3.rc1"])
      s.add_dependency(%q<railties>.freeze, [">= 4.2.7", "< 7.1.0", "!= 5.2.3", "!= 5.2.3.rc1"])
    end
  else
    s.add_dependency(%q<rake>.freeze, [">= 10.0"])
    s.add_dependency(%q<activerecord>.freeze, [">= 4.2.7", "< 7.1.0", "!= 5.2.3", "!= 5.2.3.rc1"])
    s.add_dependency(%q<railties>.freeze, [">= 4.2.7", "< 7.1.0", "!= 5.2.3", "!= 5.2.3.rc1"])
  end
end
