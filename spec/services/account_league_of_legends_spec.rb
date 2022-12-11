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

  describe '.return_match_history' do
    let(:puuid) { 'v2jpHm5Vm2EhGiQT_TwtHxiiQSc7sa_WiHb6nXjFaqXtqDx0ZObPsFiI_0k3qd5wCFRmEi9rUvMbeg' }

    it 'returs array with match id' do
      allow(described_class).to receive(:return_match_history).with(puuid).and_return(['BR_TESTHISTORY'])

      response = described_class.return_match_history(puuid)

      expect(response).to eq ['BR_TESTHISTORY']
    end
  end

  describe '.return_summoner_name_by_puuid' do
    let(:puuid) { 'v2jpHm5Vm2EhGiQT_TwtHxiiQSc7sa_WiHb6nXjFaqXtqDx0ZObPsFiI_0k3qd5wCFRmEi9rUvMbeg' }

    it 'returns summuner name' do
      allow(described_class).to receive(:return_summoner_name_by_puuid).with(puuid).and_call_original

      response = described_class.return_summoner_name_by_puuid(puuid)

      expect(response).to eq 'BlackHoot'
    end
  end

  describe '.search_for_player_from_history' do
    let(:match_id) { 'BR1_2404338530' }

    it 'returns array with summoner names from match ' do
      players_nicknames = ['summoner','summoner','summoner','summoner','summoner','summoner','summoner','summoner','summoner','summoner']
      allow(described_class).to receive(:search_for_player_from_history).with(match_id).and_return(players_nicknames)

      response = described_class.search_for_player_from_history(match_id)

      expect(response).to eq players_nicknames
    end
  end
end