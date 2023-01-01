require 'rails_helper'

RSpec.describe Champion, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:id_riot) }
    it { should validate_presence_of(:key) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:image) }
    it { should validate_presence_of(:skins) }
    it { should validate_presence_of(:lore) }
    it { should validate_presence_of(:blurb) }
    it { should validate_presence_of(:allytips) }
    it { should validate_presence_of(:enemytips) }
    it { should validate_presence_of(:partype) }
    it { should validate_presence_of(:info) }
    it { should validate_presence_of(:stats) }
    it { should validate_presence_of(:spells) }
    it { should validate_presence_of(:passive) }
  end
end
