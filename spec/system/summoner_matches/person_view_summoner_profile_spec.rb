require 'rails_helper'

describe 'User search a profile' do
  context 'when view summoner profile in match' do
    it 'and finds result' do
      VCR.use_cassette('system/summoner_match/user_view_a_summoner_profile_in_history_success') do
        visit root_path
        fill_in 'search', with: 'Lyord'
        click_on 'Buscar'
        VCR.use_cassette('system/summoner_match/user_click_a_summoner_profile_in_history_successs') do
          first(:link, 'Lyord').click

          expect(page).to have_content 'Lyord'
          expect(page).to have_content 'Soloq/Duo Rank'
          expect(page).to have_content 'Flex Rank'
          expect(page).to have_content 'Histórico de Partida'
          expect(current_path).to eq summoner_matches_path
        end
      end
    end
  end
end