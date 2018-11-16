class CreateJoinTableBattleOrdersUnits < ActiveRecord::Migration[5.2]
  def change
    create_join_table :battle_orders, :units do |t|
      t.index [:battle_order_id, :unit_id]
      t.index [:unit_id, :battle_order_id]
    end
  end
end
