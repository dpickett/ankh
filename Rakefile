require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "ankh"
    gem.summary = %Q{Protect against bots and other spam producers with simple mathematical questions}
    gem.description = %Q{Use Ankh in your Rails (2.3.x or 3.0) projects to protect against bots and other spam producers. It asks a simple
    arithmatic question to verify that the poster is human.}
    gem.email = "dpickett@enlightsolutions.com"
    gem.homepage = "http://github.com/dpickett/ankh"
    gem.authors = ["Dan Pickett"]
    gem.add_dependency "activerecord", ">= 2.3.4"
    gem.add_dependency "activesupport", ">= 2.3.4"
    gem.add_dependency "configatron", "2.6.3"
    gem.add_development_dependency "rspec", ">= 1.2.9"
    # gem.add_development_dependency "yard", ">= 0"
    gem.add_development_dependency "cucumber", ">= 0"
    gem.add_development_dependency "mocha"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

begin
  require 'spec/rake/spectask'
  Spec::Rake::SpecTask.new(:spec) do |spec|
    spec.libs << 'lib' << 'spec'
    spec.spec_files = FileList['spec/**/*_spec.rb']
  end

  Spec::Rake::SpecTask.new(:rcov) do |spec|
    spec.libs << 'lib' << 'spec'
    spec.pattern = 'spec/**/*_spec.rb'
    spec.rcov = true
  end
rescue LoadError
  puts "Rspec (or a dependency) not available. gem install rspec"
end

  task :spec => :check_dependencies

begin
  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new(:features)

  task :features => :check_dependencies
rescue LoadError
  task :features do
    abort "Cucumber is not available. In order to run features, you must: sudo gem install cucumber"
  end
end

begin
  require 'reek/adapters/rake_task'
  Reek::RakeTask.new do |t|
    t.fail_on_error = true
    t.verbose = false
    t.source_files = 'lib/**/*.rb'
  end
rescue LoadError
  task :reek do
    abort "Reek is not available. In order to run reek, you must: sudo gem install reek"
  end
end

begin
  require 'roodi'
  require 'roodi_task'
  RoodiTask.new do |t|
    t.verbose = false
  end
rescue LoadError
  task :roodi do
    abort "Roodi is not available. In order to run roodi, you must: sudo gem install roodi"
  end
end

task :default => :spec

begin
  require 'yard'
  YARD::Rake::YardocTask.new
rescue LoadError
  task :yardoc do
    abort "YARD is not available. In order to run yardoc, you must: sudo gem install yard"
  end
end
