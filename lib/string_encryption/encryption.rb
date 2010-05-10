require 'base64'
require 'uri'

module StringEncryption
  def self.decrypt(encrypted_data, decryption_key=ENV['LIB_STRING_ENCRYPTION_KEY'])
    des = OpenSSL::Cipher::Cipher.new("des-ede3-cbc")
    des.decrypt
    des.key = decryption_key
    encrypted_data = URI.unescape(encrypted_data)
    encrypted_data = Base64.decode64(encrypted_data)
    
    des.iv =  encrypted_data.slice!(0,8)
    
    des.update(encrypted_data) + des.final  
  end
  
  def self.encrypt(string, encryption_key=ENV['LIB_STRING_ENCRYPTION_KEY'])
    des = OpenSSL::Cipher::Cipher.new("des-ede3-cbc")
    des.encrypt
    des.key = encryption_key
    
    des.iv = iv = SecureRandom.hex(4)
    
    data = des.update(string) + des.final  
    data = iv + data
    data = Base64.encode64(data)
    data = URI.escape(data, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
  end
end
