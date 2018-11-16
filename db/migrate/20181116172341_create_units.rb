class CreateUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :units do |t|
      t.integer :strength
      t.integer :type_of
      t.integer :starting_hex
      t.string :name
      t.integer :status
      t.integer :vp_value
      t.timestamps
    end
  end
end
