# -*- encoding: utf-8 -*-
# stub: omniauth-auth0 3.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "omniauth-auth0".freeze
  s.version = "3.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Auth0".freeze]
  s.date = "2022-12-08"
  s.description = "Auth0 is an authentication broker that supports social identity providers as well as enterprise identity providers such as Active Directory, LDAP, Google Apps, Salesforce.\n\nOmniAuth is a library that standardizes multi-provider authentication for web applications. It was created to be powerful, flexible, and do as little as possible.\n\nomniauth-auth0 is the OmniAuth strategy for Auth0.\n".freeze
  s.email = ["info@auth0.com".freeze]
  s.homepage = "https://github.com/auth0/omniauth-auth0".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.3.7".freeze
  s.summary = "OmniAuth OAuth2 strategy for the Auth0 platform.".freeze

  s.installed_by_version = "3.3.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<omniauth>.freeze, ["~> 2"])
    s.add_runtime_dependency(%q<omniauth-oauth2>.freeze, ["~> 1"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
  else
    s.add_dependency(%q<omniauth>.freeze, ["~> 2"])
    s.add_dependency(%q<omniauth-oauth2>.freeze, ["~> 1"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
  end
end
