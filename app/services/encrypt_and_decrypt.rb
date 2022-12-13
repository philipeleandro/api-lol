class EncryptAndDecrypt 
  def self.encrypt_summoner_info(info)
    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base[0..31])
    crypt.encrypt_and_sign(info)
  end

  def self.decrypt_summoner_info(info)
    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base[0..31])
    crypt.decrypt_and_verify(info)
  end
end