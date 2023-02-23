# -*- encoding: utf-8 -*-
# stub: mongoid 8.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "mongoid".freeze
  s.version = "8.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://jira.mongodb.org/projects/MONGOID", "changelog_uri" => "https://github.com/mongodb/mongoid/releases", "documentation_uri" => "https://docs.mongodb.com/mongoid/", "homepage_uri" => "https://mongoid.org/", "source_code_uri" => "https://github.com/mongodb/mongoid" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["The MongoDB Ruby Team".freeze]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDfDCCAmSgAwIBAgIBATANBgkqhkiG9w0BAQUFADBCMRQwEgYDVQQDDAtkcml2\nZXItcnVieTEVMBMGCgmSJomT8ixkARkWBTEwZ2VuMRMwEQYKCZImiZPyLGQBGRYD\nY29tMB4XDTIyMDMzMDE5MTcwMloXDTIzMDMzMDE5MTcwMlowQjEUMBIGA1UEAwwL\nZHJpdmVyLXJ1YnkxFTATBgoJkiaJk/IsZAEZFgUxMGdlbjETMBEGCgmSJomT8ixk\nARkWA2NvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANFdSAa8fRm1\nbAM9za6Z0fAH4g02bqM1NGnw8zJQrE/PFrFfY6IFCT2AsLfOwr1maVm7iU1+kdVI\nIQ+iI/9+E+ArJ+rbGV3dDPQ+SLl3mLT+vXjfjcxMqI2IW6UuVtt2U3Rxd4QU0kdT\nJxmcPYs5fDN6BgYc6XXgUjy3m+Kwha2pGctdciUOwEfOZ4RmNRlEZKCMLRHdFP8j\n4WTnJSGfXDiuoXICJb5yOPOZPuaapPSNXp93QkUdsqdKC32I+KMpKKYGBQ6yisfA\n5MyVPPCzLR1lP5qXVGJPnOqUAkvEUfCahg7EP9tI20qxiXrR6TSEraYhIFXL0EGY\nu8KAcPHm5KkCAwEAAaN9MHswCQYDVR0TBAIwADALBgNVHQ8EBAMCBLAwHQYDVR0O\nBBYEFFt3WbF+9JpUjAoj62cQBgNb8HzXMCAGA1UdEQQZMBeBFWRyaXZlci1ydWJ5\nQDEwZ2VuLmNvbTAgBgNVHRIEGTAXgRVkcml2ZXItcnVieUAxMGdlbi5jb20wDQYJ\nKoZIhvcNAQEFBQADggEBAM0s7jz2IGD8Ms035b1tMnbNP2CBPq3pen3KQj7IkGF7\nx8LPDdOqUj4pUMLeefntX/PkSvwROo677TnWK6+GLayGm5xLHrZH3svybC6QtqTR\nmVOLUoZ4TgUmtnMUa/ZvgrIsOeiCysjSf4WECuw7g+LE6jcpLepgYTLk2u1+5SgH\nJVENj0BMkdeZIKkc2G97DSx3Zrmz7QWAaH+99XlajJbfcgvhDso+ffQkTBlOgLBg\n+WyKQ+QTIdtDiyf2LQmxWnxt/W1CmScjdLS7/yXGkkB/D9Uy+sJD747O/B9P238Q\nXnerrtyOu04RsWDvaZkCwSDVzoqfICh4CP1mlde73Ts=\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2022-12-14"
  s.description = "Mongoid is an ODM (Object Document Mapper) Framework for MongoDB, written in Ruby.".freeze
  s.email = "dbx-ruby@mongodb.com".freeze
  s.homepage = "https://mongoid.org".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6".freeze)
  s.rubygems_version = "3.1.2".freeze
  s.summary = "Elegant Persistence in Ruby for MongoDB.".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activemodel>.freeze, [">= 5.1", "< 7.1", "!= 7.0.0"])
    s.add_runtime_dependency(%q<mongo>.freeze, [">= 2.18.0", "< 3.0.0"])
    s.add_runtime_dependency(%q<ruby2_keywords>.freeze, ["~> 0.0.5"])
    s.add_development_dependency(%q<bson>.freeze, [">= 4.14.0", "< 5.0.0"])
  else
    s.add_dependency(%q<activemodel>.freeze, [">= 5.1", "< 7.1", "!= 7.0.0"])
    s.add_dependency(%q<mongo>.freeze, [">= 2.18.0", "< 3.0.0"])
    s.add_dependency(%q<ruby2_keywords>.freeze, ["~> 0.0.5"])
    s.add_dependency(%q<bson>.freeze, [">= 4.14.0", "< 5.0.0"])
  end
end
