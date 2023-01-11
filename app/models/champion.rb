class Champion < ApplicationRecord
  serialize :image, Hash
  serialize :info, Hash
  serialize :stats, Hash
  serialize :passive, Hash
  serialize :skins, Array
  serialize :allytips, Array
  serialize :enemytips, Array
  serialize :tags, Array
  serialize :spells, Array
  serialize :recommended, Array

  validates :id_riot, :key, :name, :title, :image, :skins, :lore, :blurb, :allytips, :enemytips, :tags, :partype, :info, :stats, :spells, :passive, presence: true
  validates :name, :id_riot, uniqueness: true
end
