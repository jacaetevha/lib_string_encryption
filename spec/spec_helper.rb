$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'lib_string_encryption'
require 'spec'
require 'spec/autorun'

ENV['LIB_STRING_ENCRYPTION_KEY'] = StringEncryption::SecureRandom.hex(14)

Spec::Runner.configure do |config|
  
end
