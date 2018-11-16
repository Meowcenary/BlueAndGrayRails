class CreateHexes < ActiveRecord::Migration[5.2]
  def change
    create_table :hexes do |t|
      t.integer :game_id
      t.integer :terrain
      t.timestamps
    end
  end
end
