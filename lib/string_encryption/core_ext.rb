String.class_eval do 
  def encrypt 
    StringEncryption.encrypt(self)
  end
  
  def decrypt 
    StringEncryption.decrypt(self)
  end
end 
