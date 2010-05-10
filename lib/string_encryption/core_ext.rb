String.class_eval do 
  def encrypt key=ENV['LIB_STRING_ENCRYPTION_KEY']
    StringEncryption.encrypt(self, key)
  end
  
  def decrypt key=ENV['LIB_STRING_ENCRYPTION_KEY']
    StringEncryption.decrypt(self, key)
  end
end 
