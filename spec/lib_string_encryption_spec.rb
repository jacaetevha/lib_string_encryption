require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'String Encryption' do
  it "should encrypt strings" do
    string_value.should_not == string_value.encrypt
  end

  it "should decrypt a string that's been encrypted" do
    string_value.encrypt.decrypt.should == string_value
  end
  
  it "should be able to encrypt with a given key" do
    key = StringEncryption::SecureRandom.base64(60)
    string_value.encrypt(key).decrypt(key).should == string_value
  end

  it "should fail to decrypt a string encrypted with the wrong key" do
    value = string_value.encrypt
    original_encryption_string = ENV['LIB_STRING_ENCRYPTION_KEY']
    new_key = StringEncryption::SecureRandom.random_bytes(95)
    string_value.encrypt(new_key).decrypt(new_key).should == string_value
    lambda {string_value.encrypt(original_encryption_string).decrypt(new_key)}.should raise_error(OpenSSL::Cipher::CipherError)
    lambda {string_value.encrypt(new_key).decrypt(original_encryption_string)}.should raise_error(OpenSSL::Cipher::CipherError)
  end
  
  def string_value
    "Hello World"
  end
end