class CreateScenarios < ActiveRecord::Migration[5.2]
  def change
    create_table :scenarios do |t|
      t.belongs_to :game, index: true
      t.string :title
      t.integer :turns
      t.timestamps
    end
  end
end
