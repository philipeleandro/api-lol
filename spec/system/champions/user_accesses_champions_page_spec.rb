require 'rails_helper'

describe 'User accesses champions page' do
  it 'and find champions list' do
    visit root_path
    click_on 'Campeões'

    expect(current_path).to eq champions_path
    expect(page).to have_content 'Lista de Campeões'
  end
end