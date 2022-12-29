# -*- encoding: utf-8 -*-
# stub: mongoid 7.3.4 ruby lib

Gem::Specification.new do |s|
  s.name = "mongoid".freeze
  s.version = "7.3.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://jira.mongodb.org/projects/MONGOID", "changelog_uri" => "https://github.com/mongodb/mongoid/releases", "documentation_uri" => "https://docs.mongodb.com/mongoid/", "homepage_uri" => "https://mongoid.org/", "source_code_uri" => "https://github.com/mongodb/mongoid" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Durran Jordan".freeze]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDfDCCAmSgAwIBAgIBATANBgkqhkiG9w0BAQsFADBCMRQwEgYDVQQDDAtkcml2\nZXItcnVieTEVMBMGCgmSJomT8ixkARkWBTEwZ2VuMRMwEQYKCZImiZPyLGQBGRYD\nY29tMB4XDTIyMDIyMjE4NDYwMloXDTIzMDIyMjE4NDYwMlowQjEUMBIGA1UEAwwL\nZHJpdmVyLXJ1YnkxFTATBgoJkiaJk/IsZAEZFgUxMGdlbjETMBEGCgmSJomT8ixk\nARkWA2NvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANFdSAa8fRm1\nbAM9za6Z0fAH4g02bqM1NGnw8zJQrE/PFrFfY6IFCT2AsLfOwr1maVm7iU1+kdVI\nIQ+iI/9+E+ArJ+rbGV3dDPQ+SLl3mLT+vXjfjcxMqI2IW6UuVtt2U3Rxd4QU0kdT\nJxmcPYs5fDN6BgYc6XXgUjy3m+Kwha2pGctdciUOwEfOZ4RmNRlEZKCMLRHdFP8j\n4WTnJSGfXDiuoXICJb5yOPOZPuaapPSNXp93QkUdsqdKC32I+KMpKKYGBQ6yisfA\n5MyVPPCzLR1lP5qXVGJPnOqUAkvEUfCahg7EP9tI20qxiXrR6TSEraYhIFXL0EGY\nu8KAcPHm5KkCAwEAAaN9MHswCQYDVR0TBAIwADALBgNVHQ8EBAMCBLAwHQYDVR0O\nBBYEFFt3WbF+9JpUjAoj62cQBgNb8HzXMCAGA1UdEQQZMBeBFWRyaXZlci1ydWJ5\nQDEwZ2VuLmNvbTAgBgNVHRIEGTAXgRVkcml2ZXItcnVieUAxMGdlbi5jb20wDQYJ\nKoZIhvcNAQELBQADggEBAKuc9439GmybuWBZ5j33NcqKu+nozTgjDOk+nWpe4SfG\ntWbk6IsDypCYwJOjD/YoBn2betLRO6GWDbkviTCvf2QmS2pvpkUw3acTPefbnR/O\nytKOXzAuU24IN8Xp38O5uPoYA0xi4/9a2865AGT7y+XImus/Pd2ue6E21L4h6Eq1\nIP/sZUO9yU/+PRSeMv55DSURuJGgDHh1TMjw0Td+xXfPbH47omLyI32JoMpRXJUE\n1RLPCb/r/Y+pZ0OeAJRwTJ3+0HfJbZmRmjW1mo/9xC6/VMNY5S0va0DkNZVmAtW3\nt07cSm70CtkeWPr1kLSbIuzWVW105PrOFqxZ5dP6oVA=\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2022-02-22"
  s.description = "Mongoid is an ODM (Object Document Mapper) Framework for MongoDB, written in Ruby.".freeze
  s.homepage = "https://mongoid.org".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3".freeze)
  s.rubygems_version = "3.0.1".freeze
  s.summary = "Elegant Persistence in Ruby for MongoDB.".freeze

  s.installed_by_version = "3.0.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activemodel>.freeze, [">= 5.1", "< 7.1", "!= 7.0.0"])
      s.add_runtime_dependency(%q<mongo>.freeze, [">= 2.10.5", "< 3.0.0"])
      s.add_runtime_dependency(%q<ruby2_keywords>.freeze, ["~> 0.0.5"])
      s.add_development_dependency(%q<bson>.freeze, [">= 4.9.4", "< 5.0.0"])
    else
      s.add_dependency(%q<activemodel>.freeze, [">= 5.1", "< 7.1", "!= 7.0.0"])
      s.add_dependency(%q<mongo>.freeze, [">= 2.10.5", "< 3.0.0"])
      s.add_dependency(%q<ruby2_keywords>.freeze, ["~> 0.0.5"])
      s.add_dependency(%q<bson>.freeze, [">= 4.9.4", "< 5.0.0"])
    end
  else
    s.add_dependency(%q<activemodel>.freeze, [">= 5.1", "< 7.1", "!= 7.0.0"])
    s.add_dependency(%q<mongo>.freeze, [">= 2.10.5", "< 3.0.0"])
    s.add_dependency(%q<ruby2_keywords>.freeze, ["~> 0.0.5"])
    s.add_dependency(%q<bson>.freeze, [">= 4.9.4", "< 5.0.0"])
  end
end
