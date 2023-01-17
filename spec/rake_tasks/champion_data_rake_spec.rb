require 'rails_helper'

describe '' do
  context 'when there is no champion' do
    it 'creates champions in db' do
      VCR.use_cassette('services/tasks/champion_data:populate') do
        Rails.application.load_tasks

        Rake::Task['champion_data:populate'].invoke

        expect(Champion.first.name).to eq 'Aatrox'
      end
    end
  end

  context 'when there is champion' do
    let!(:champion) { create(:champion, name: 'Aatrox', key: 'Ali')}

    it 'creates champions in db' do
      VCR.use_cassette('services/tasks/champion_data:populate') do
        Rails.application.load_tasks

        Rake::Task['champion_data:populate'].invoke

        expect(Champion.first.name).to eq 'Aatrox'
        expect(Champion.first.key).to eq '266'
      end
    end
  end
end