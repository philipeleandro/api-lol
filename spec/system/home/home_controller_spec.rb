require 'rails_helper'

describe 'User visits home' do
  context 'when search for summoner' do
    it 'and finds result' do
      VCR.use_cassette('system/home/user_search_a_summoner_success') do
        visit root_path
        fill_in 'search', with: 'Lyord'
        click_on 'Search'

        expect(page).to have_content 'Nickname'
        expect(page).to have_content 'Soloq/Duo Rank'
        expect(page).to have_content 'Flex Rank'
        expect(page).to have_content 'Histórico de Partida'
        expect(current_path).to eq summoner_matches_path
      end
    end

    it 'and does not find result' do
      VCR.use_cassette('system/home/user_search_a_failure') do
        visit root_path
        fill_in 'search', with: 'Testing for application'
        click_on 'Search'

        expect(page).to have_content 'Invocador não encontrado!'
        expect(current_path).not_to eq summoner_matches_path
      end
    end
  end
end