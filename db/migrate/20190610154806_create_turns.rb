class CreateTurns < ActiveRecord::Migration[5.2]
  def change
    create_table :turns do |t|
      t.integer :player_unit_id
      t.integer :opponent_unit_id

      t.timestamps
    end
  end
end
