class AddIndexToHexesGameId < ActiveRecord::Migration[5.2]
  def change
    add_index :hexes, :game_id
  end
end
