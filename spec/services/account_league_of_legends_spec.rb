require 'rails_helper'

describe AccountLeagueOfLegends do
  describe '.return_info' do
    context 'when nickname is valid' do
      it 'calls method to info account data' do
        VCR.use_cassette('services/account_league_of_legends/return_info_by_name/success') do
          allow(described_class).to receive(:return_info).with('Lyord').and_call_original

          result = described_class.return_info('Lyord')
          
          expect(result.keys).to include 'id'
          expect(result.keys).to include 'name'
          expect(result.keys).to include 'summonerLevel'
        end
      end
    end

    context 'when nickname is not valid' do
      it 'returns a error message' do
        VCR.use_cassette('services/account_league_of_legends/return_info_by_name/failure') do
          allow(described_class).to receive(:return_info).with('Application testing').and_call_original

          result = described_class.return_info('Application testing')
          
          expect(result['status']['message']).to eq 'Data not found - summoner not found'
          expect(result['status']['status_code']).to eq 404
        end
      end
    end
  end

  describe '.return_rank' do
    context 'when encrypted_summonerid is valid' do
      let(:encrypted_summonerid) { 'AsH5zLUcK6wNDoIzDe_3dhS-y_462N7K0wnK64-i4NMwGA' }

      it 'calls method to info account rank' do
        VCR.use_cassette('services/account_league_of_legends/return_rank/success') do
          allow(described_class).to receive(:return_rank).with(encrypted_summonerid).and_call_original

          result = described_class.return_rank(encrypted_summonerid)

          expect(result.first.keys).to include 'rank'
          expect(result.first.keys).to include 'leaguePoints'
        end
      end
    end

    context 'when encrypted_summonerid is not valid' do
      let(:encrypted_summonerid) { '1233456789798abcdefg' }

      it 'returns a error message' do
        VCR.use_cassette('services/account_league_of_legends/return_rank/failure') do
          allow(described_class).to receive(:return_rank).with(encrypted_summonerid).and_call_original

          result = described_class.return_rank(encrypted_summonerid)

          expect(result['status']['message']).to eq "Bad Request - Exception decrypting #{encrypted_summonerid}"
          expect(result['status']['status_code']).to eq 400
        end
      end
    end
  end

  describe '.return_match_history' do
    context 'when puuid is valid' do
      let(:puuid) { 'v2jpHm5Vm2EhGiQT_TwtHxiiQSc7sa_WiHb6nXjFaqXtqDx0ZObPsFiI_0k3qd5wCFRmEi9rUvMbeg' }

      it 'returs array with match id' do
        VCR.use_cassette('services/account_league_of_legends/return_match_history/success') do
          allow(described_class).to receive(:return_match_history).with(puuid).and_return(['BR_TESTHISTORY'])

          response = described_class.return_match_history(puuid)

          expect(response).to eq ['BR_TESTHISTORY']
        end
      end
    end

    context 'when puuid is not valid' do
      let(:puuid) { '1233456789798abcdefg' }

      it 'returns a error message' do
        VCR.use_cassette('services/account_league_of_legends/return_match_history/failure') do
          allow(described_class).to receive(:return_match_history).with(puuid).and_call_original

          result = described_class.return_match_history(puuid)

          expect(result['status']['message']).to eq "Bad Request - Exception decrypting #{puuid}"
          expect(result['status']['status_code']).to eq 400
        end
      end
    end
  end

  describe '.return_summoner_info_by_puuid' do
    context 'when puuid is valid' do
      let(:puuid) { 'v2jpHm5Vm2EhGiQT_TwtHxiiQSc7sa_WiHb6nXjFaqXtqDx0ZObPsFiI_0k3qd5wCFRmEi9rUvMbeg' }

      it 'returns summuner name' do
        VCR.use_cassette('services/account_league_of_legends/return_info_by_puuid/success') do
          allow(described_class).to receive(:return_summoner_info_by_puuid).with(puuid).and_call_original

          response = described_class.return_summoner_info_by_puuid(puuid)['name']

          expect(response).to eq 'BlackHoot'
        end
      end
    end

    context 'when puuid is not valid' do
      let(:puuid) { '123456789qwerty' }

      it 'does not returns summuner name' do
        VCR.use_cassette('services/account_league_of_legends/return_info_by_puuid/failure') do
          allow(described_class).to receive(:return_summoner_info_by_puuid).with(puuid).and_call_original

          result = described_class.return_summoner_info_by_puuid(puuid)['name']

          expect(result).to eq  nil
        end
      end
    end
  end

  describe '.search_for_player_from_history' do
    context 'when match id is valid' do
      let(:puuid) { 'v2jpHm5Vm2EhGiQT_TwtHxiiQSc7sa_WiHb6nXjFaqXtqDx0ZObPsFiI_0k3qd5wCFRmEi9rUvMbeg' }

      it 'returns array with summoner names from match ' do
        VCR.use_cassette('services/account_league_of_legends/search_for_player_from_history/success') do
          players_nicknames = ['summoner','summoner','summoner','summoner','summoner','summoner','summoner','summoner','summoner','summoner']
          allow(described_class).to receive(:search_for_player_from_history).with(puuid).and_return(players_nicknames)

          response = described_class.search_for_player_from_history(puuid)

          expect(response).to eq players_nicknames
        end
      end
    end

    context 'when match id is not valid' do
      let(:puuid) { '123qwer456asd789' }

      it 'returns array with summoner names from match ' do
        VCR.use_cassette('services/account_league_of_legends/search_for_player_from_history/failure') do
          allow(described_class).to receive(:search_for_player_from_history).with(puuid).and_call_original

          expect{ described_class.search_for_player_from_history(puuid) }.to raise_error NoMethodError
        end
      end
    end
  end
end