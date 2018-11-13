require 'base64'
require 'openssl'
require 'gooddata/crypto/version'

module Gooddata
  module Crypto
    class << self
      # encrypts data with the given key. returns a binary data with the
      # unhashed random iv in the first 16 bytes
      def encrypt(data, key)
        cipher = OpenSSL::Cipher::Cipher.new('aes-256-cbc')
        cipher.encrypt
        cipher.key = key = Digest::SHA256.digest(key)
        random_iv = cipher.random_iv
        cipher.iv = Digest::SHA256.digest(random_iv + key)[0..15]
        encrypted = cipher.update(data)
        encrypted << cipher.final
        # add unhashed iv to front of encrypted data

        Base64.encode64(random_iv + encrypted)
      end

      def decrypt(database64, key)
        return '' if key.nil? || key.empty?

        data = Base64.decode64(database64)

        cipher = OpenSSL::Cipher::Cipher.new('aes-256-cbc')
        cipher.decrypt
        cipher.key = cipher_key = Digest::SHA256.digest(key)
        random_iv = data[0..15] # extract iv from first 16 bytes
        data = data[16..data.size - 1]
        cipher.iv = Digest::SHA256.digest(random_iv + cipher_key)[0..15]
        begin
          decrypted = cipher.update(data)
          decrypted << cipher.final
        rescue
          puts 'Error'
          return nil
        end

        decrypted
      end
    end
  end
end
