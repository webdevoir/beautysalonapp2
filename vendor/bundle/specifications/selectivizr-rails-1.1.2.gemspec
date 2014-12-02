# -*- encoding: utf-8 -*-
# stub: selectivizr-rails 1.1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "selectivizr-rails"
  s.version = "1.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jeremy Hubert"]
  s.date = "2013-07-26"
  s.description = "This selectivizr.js was built using the latest version at https://github.com/keithclark/selectivizr"
  s.email = ["jhubert@gmail.com"]
  s.homepage = "https://github.com/jhubert/selectivizr-rails"
  s.licenses = ["MIT"]
  s.rubyforge_project = "selectivizr-rails"
  s.rubygems_version = "2.2.2"
  s.summary = "Gem wrapper to include the selectivizr.js library via the asset pipeline."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rails>, [">= 3.1.0.rc4"])
    else
      s.add_dependency(%q<rails>, [">= 3.1.0.rc4"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.1.0.rc4"])
  end
end
