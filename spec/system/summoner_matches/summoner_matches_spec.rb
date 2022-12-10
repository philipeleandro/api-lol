require 'rails_helper'

describe 'User visits summoner matches page' do
  context 'when no searches for a summoner' do
    it 'shows up a alert message' do
      visit summoner_matches_path

      expect(page).to have_content 'Você deve voltar para o ínicio'
    end

    it 'redirects to home page' do
      visit summoner_matches_path
      click_on 'Voltar'

      expect(current_path).to eq root_path
    end
  end
end