class CreateJoinTableArmiesUnits < ActiveRecord::Migration[5.2]
  def change
    create_join_table :armies, :units do |t|
      t.index [:army_id, :unit_id]
      t.index [:unit_id, :army_id]
    end
  end
end
