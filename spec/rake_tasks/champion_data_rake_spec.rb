require 'rails_helper'

describe 'champion_data:populate' do
  before do
    Rails.application.load_tasks
  end

  after(:each) do 
    Rake::Task.clear
  end
  
  context 'when there is no champion in database' do
    it 'creates champions in db' do
      VCR.use_cassette('services/tasks/champion_data:populate') do
        Rake::Task['champion_data:populate'].invoke

        expect(Champion.first.name).to eq 'Aatrox'
      end
    end
  end

  context 'when there is champion' do
    let!(:champion) { create(:champion, name: 'Aatrox', key: 'Ali')}
  
    it 'creates champions in db' do
      VCR.use_cassette('services/tasks/champion_data:populate') do
  
        Rake::Task['champion_data:populate'].invoke
        
        expect(Champion.first.name).to eq 'Aatrox'
        expect(Champion.first.key).to eq '266'
      end
    end
  end
end