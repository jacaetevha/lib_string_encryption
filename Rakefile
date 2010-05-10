$:.unshift File.expand_path( File.join( File.dirname(__FILE__), 'lib') )
require 'string_encryption'

desc "Produces a constant that can be set in the environment for string encryption"
task :key do
  key = StringEncryption::SecureRandom.hex(14)
  ENV['STRING_ENCRYPTION_KEY'] = key
  key
end

task :print_key => :key do
  puts key
end