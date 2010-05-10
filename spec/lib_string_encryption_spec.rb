require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'String Encryption' do
  it "should encrypt strings" do
    "Hello World".should_not == "Hello World".encrypt 
  end
  
  it "should decrypt a string that's been encrypted" do
    "Hello World".encrypt.decrypt.should == "Hello World"
  end 
end