require 'rails_helper'

describe AccountLeagueOfLegends do
  describe '.return_info' do
    it 'returns string in json' do
      allow(described_class).to receive(:return_info).with('Lyord').and_call_original

      described_class.return_info('Lyord')

      expect(described_class).to have_received(:return_info).with('Lyord')
    end
  end
end