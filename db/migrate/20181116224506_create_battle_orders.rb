class CreateBattleOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :battle_orders do |t|
      t.belongs_to :scenario, index: true
      t.timestamps
    end
  end
end
