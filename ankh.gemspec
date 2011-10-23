# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ankh}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Dan Pickett}]
  s.date = %q{2011-10-23}
  s.description = %q{Use Ankh in your Rails (2.3.x or 3.0) projects to protect against bots and other spam producers. It asks a simple
    arithmatic question to verify that the poster is human.}
  s.email = %q{dpickett@enlightsolutions.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "ankh.gemspec",
    "features/ankh.feature",
    "features/step_definitions/ankh_steps.rb",
    "features/support/env.rb",
    "lib/ankh.rb",
    "lib/ankh/model.rb",
    "lib/ankh/question.rb",
    "lib/ankh/rails/legacy.rb",
    "lib/ankh/validations/human.rb",
    "spec/ankh/model_spec.rb",
    "spec/ankh/question_spec.rb",
    "spec/ankh_spec.rb",
    "spec/spec.opts",
    "spec/spec_helper.rb",
    "spec/support/active_record_spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/dpickett/ankh}
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{Protect against bots and other spam producers with simple mathematical questions}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 2.3.8"])
      s.add_runtime_dependency(%q<activesupport>, [">= 2.3.8"])
      s.add_runtime_dependency(%q<configatron>, ["= 2.6.3"])
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_development_dependency(%q<cucumber>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, [">= 2.3.8"])
      s.add_dependency(%q<activesupport>, [">= 2.3.8"])
      s.add_dependency(%q<configatron>, ["= 2.6.3"])
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_dependency(%q<cucumber>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 2.3.8"])
    s.add_dependency(%q<activesupport>, [">= 2.3.8"])
    s.add_dependency(%q<configatron>, ["= 2.6.3"])
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
    s.add_dependency(%q<cucumber>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
  end
end

