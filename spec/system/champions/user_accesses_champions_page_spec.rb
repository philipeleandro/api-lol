require 'rails_helper'

describe 'User accesses champions page' do
  let!(:champion) { create(:champion) }

  before do
    create_list(:champion, 4)
  end

  it 'and find champions list' do
    visit root_path
    click_on 'Campeões'
    
    expect(current_path).to eq champions_path
    expect(page).to have_content 'Lista de Campeões'
    expect(page).to have_content champion.name
  end
end