class CreateArmies < ActiveRecord::Migration[5.2]
  def change
    create_table :armies do |t|
      t.string :title
      t.integer :victory_points
      t.belongs_to :battle, index: true
      t.belongs_to :battle_order, index: true
      t.timestamps
    end
  end
end
