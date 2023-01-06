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
end