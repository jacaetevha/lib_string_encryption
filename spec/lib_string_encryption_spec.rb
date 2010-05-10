require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'String Encryption' do
  it "should encrypt strings" do
    "Hello World".should_not == "Hello World".encrypt
  end

  it "should decrypt a string that's been encrypted" do
    "Hello World".encrypt.decrypt.should == "Hello World"
  end

  it "should fail to decrypt a string encrypted with the wrong key" do
    value = "Hello World".encrypt
    original_encryption_string = ENV['LIB_STRING_ENCRYPTION_KEY']
    begin
      ENV['LIB_STRING_ENCRYPTION_KEY'] = StringEncryption::SecureRandom.hex(14)
      "Hello World".encrypt.should_not == value
      "Hello World".encrypt.decrypt.should == "Hello World"
      lambda {value.decrypt}.should raise_error(OpenSSL::Cipher::CipherError)
    ensure
      ENV['LIB_STRING_ENCRYPTION_KEY'] = original_encryption_string
      value.decrypt.should == "Hello World"
    end
  end
end