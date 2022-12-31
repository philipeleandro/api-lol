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
end
