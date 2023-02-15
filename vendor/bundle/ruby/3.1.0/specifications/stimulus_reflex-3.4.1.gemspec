# -*- encoding: utf-8 -*-
# stub: stimulus_reflex 3.4.1 ruby lib

Gem::Specification.new do |s|
  s.name = "stimulus_reflex".freeze
  s.version = "3.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/hopsoft/stimulus_reflex/issues", "changelog_uri" => "https://github.com/hopsoft/stimulus_reflex/CHANGELOG.md", "documentation_uri" => "https://docs.stimulusreflex.com", "homepage_uri" => "https://github.com/hopsoft/stimulus_reflex", "source_code_uri" => "https://github.com/hopsoft/stimulus_reflex" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nathan Hopkins".freeze]
  s.date = "2021-01-26"
  s.email = ["natehop@gmail.com".freeze]
  s.homepage = "https://github.com/hopsoft/stimulus_reflex".freeze
  s.licenses = ["MIT".freeze]
  s.post_install_message = "Friendly reminder: When updating the stimulus_reflex gem,\ndon't forget to update your npm package as well.\n\nSee https://www.npmjs.com/package/stimulus_reflex\n".freeze
  s.rubygems_version = "3.3.7".freeze
  s.summary = "Build reactive applications with the Rails tooling you already know and love.".freeze

  s.installed_by_version = "3.3.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rack>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<rails>.freeze, [">= 5.2"])
    s.add_runtime_dependency(%q<redis>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<cable_ready>.freeze, [">= 4.5"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 2.0"])
    s.add_development_dependency(%q<pry-nav>.freeze, [">= 0"])
    s.add_development_dependency(%q<pry>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<standardrb>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rack>.freeze, [">= 0"])
    s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
    s.add_dependency(%q<rails>.freeze, [">= 5.2"])
    s.add_dependency(%q<redis>.freeze, [">= 0"])
    s.add_dependency(%q<cable_ready>.freeze, [">= 4.5"])
    s.add_dependency(%q<bundler>.freeze, ["~> 2.0"])
    s.add_dependency(%q<pry-nav>.freeze, [">= 0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<standardrb>.freeze, [">= 0"])
  end
end
