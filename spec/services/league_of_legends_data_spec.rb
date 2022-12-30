require 'rails_helper'

describe LeagueOfLegendsData do
  describe '.name_champions' do
    it 'returns array with champions name' do
      VCR.use_cassette('services/league_of_legends_data/name_champions/success') do
        allow(described_class).to receive(:name_champions).and_return(['Fizz','Aatrox','Alistar'])

        result = described_class.name_champions
        
        expect(result).to be_an(Array)
        expect(result.first).to eq 'Fizz'
        expect(result.last).to eq 'Alistar'
        expect(result.count).to eq 3
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
        expect(result.keys).to include 'Alistar', 'image', 'spells'
      end
    end
  end
end