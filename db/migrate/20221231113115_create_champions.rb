class CreateChampions < ActiveRecord::Migration[7.0]
  def change
    create_table :champions do |t|
      t.string :id_riot
      t.string :key
      t.string :name
      t.string :title
      t.string :image
      t.string :skins
      t.string :lore
      t.string :blurb
      t.string :allytips
      t.string :enemytips
      t.string :tags
      t.string :partype
      t.string :info
      t.string :stats
      t.string :spells
      t.string :passive
      t.string :recommended

      t.timestamps
    end
  end
end
