require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "lib_string_encryption"
    gem.summary = %Q{A library that allows for super simple string encryption}
    gem.description = %Q{String Encryption library}
    gem.email = "jacaetevha@gmail.com"
    gem.homepage = "http://github.com/jacaetevha/lib_string_encryption"
    gem.authors = ["Jason Rogers"]
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.add_development_dependency "yard", ">= 0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

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

task :spec => :check_dependencies

task :default => :spec

begin
  require 'yard'
  YARD::Rake::YardocTask.new
rescue LoadError
  task :yardoc do
    abort "YARD is not available. In order to run yardoc, you must: sudo gem install yard"
  end
end

desc "Produces a constant for string encryption and sets it in ENV['LIB_STRING_ENCRYPTION_KEY']"
task :key do
  $:.unshift 'lib'
  require 'lib_string_encryption'
  key = StringEncryption::SecureRandom.hex(14)
  ENV['LIB_STRING_ENCRYPTION_KEY'] = key
  key
end

task :print_key => :key do
  puts ENV['LIB_STRING_ENCRYPTION_KEY']
end