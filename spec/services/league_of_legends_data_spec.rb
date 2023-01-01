require 'rails_helper'

describe LeagueOfLegendsData do
  describe '.name_champions' do
    it 'returns array with champions name' do
      VCR.use_cassette('services/league_of_legends_data/name_champions/success') do
        allow(described_class).to receive(:name_champions).and_call_original

        result = described_class.name_champions
        
        expect(result).to be_an(Array)
        expect(result).to include 'Alistar'
        expect(result).to include 'Zyra'
      end
    end
  end

  describe '.champion_data' do
    it 'returns champion info' do
      VCR.use_cassette('services/league_of_legends_data/champion_data/success') do
        allow(described_class).to receive(:champion_data).with('Alistar').and_call_original

        result = described_class.champion_data('Alistar')['data']['Alistar']

        expect(result).to be_a(Hash)
        expect(result['name']).to eq 'Alistar'
        expect(result.keys).to include 'key', 'name', 'image', 'spells'
      end
    end
  end
end