class CreateBattles < ActiveRecord::Migration[5.2]
  def change
    create_table :battles do |t|
      t.belongs_to :game, index: true
      t.belongs_to :campaign, index: true
      t.belongs_to :scenario, index: true
      t.integer :current_turn
      t.timestamps
    end
  end
end
