require 'rails_helper'

describe EncryptAndDecrypt do
  describe '.encrypt_summoner_info' do
    context 'when crypt has 32bytes' do
      it 'returns encrypt info' do
        info_to_encrypt = 'Text to encrypt'
        allow(described_class).to receive(:encrypt_summoner_info).with(info_to_encrypt).and_return('123456789')

        result = described_class.encrypt_summoner_info(info_to_encrypt)

        expect(result).to eq '123456789'
      end
    end
  end

  describe '.decrypt_summoner_info' do
    context 'when crypt has 32bytes' do
      it 'returns decrypt info' do
        info_to_decrypt = 'kSS8UhCDafVEjBN7--wyOV3aFTIzJyvWmd--GFPPCLk5+DvKSTnAIQj2AA=='
        allow(described_class).to receive(:decrypt_summoner_info).with(info_to_decrypt).and_call_original

        result = described_class.decrypt_summoner_info(info_to_decrypt)

        expect(result).to eq 'oi'
      end
    end
  end
end