require 'rails_helper'

describe 'champion details' do
  let!(:champion) { create(:champion) }

  before do
    create_list(:champion, 4)
  end

  it 'goes to show page' do
    visit root_path
    click_on 'Campeões'
    click_on "#{champion.name}"

    expect(current_path).to eq champion_path(champion.id)
  end

  it 'explains champion spells' do
    visit root_path
    click_on 'Campeões'
    click_on "#{champion.name}"

    expect(page).to have_content("#{champion.passive['name']} - Passiva")
    expect(page).to have_content("#{champion.spells[0]['name']} - Q")
    expect(page).to have_content("#{champion.spells[1]['name']} - W")
    expect(page).to have_content("#{champion.spells[2]['name']} - E")
    expect(page).to have_content("#{champion.spells[3]['name']} - R")
  end
end