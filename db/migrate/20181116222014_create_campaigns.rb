class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.belongs_to :game, index: true

      t.timestamps
    end
  end
end
