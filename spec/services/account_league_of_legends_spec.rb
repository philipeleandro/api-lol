require 'rails_helper'

describe AccountLeagueOfLegends do
  describe '.return_info' do
    it 'calls method to info account data' do
      allow(described_class).to receive(:return_info).with('Lyord').and_call_original

      described_class.return_info('Lyord')

      expect(described_class).to have_received(:return_info).with('Lyord')
    end
  end

  describe '.return_rank' do
    let(:encrypted_summonerid) { 'HMRc7Fg7VTIlcqzwKtRfGyaZ-LgadmmODx96lYHwzB7R7w' }

    it 'calls method to info account rank' do
      allow(described_class).to receive(:return_rank).with(encrypted_summonerid).and_call_original

      described_class.return_rank(encrypted_summonerid)

      expect(described_class).to have_received(:return_rank).with(encrypted_summonerid)
    end
  end
end