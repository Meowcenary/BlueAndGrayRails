class Army < ApplicationRecord
  has_and_belongs_to_many :units, class_name: 'Unit', foreign_key: 'unit_id', join_table: 'armies_units', association_foreign_key: 'unit_id'
  has_many :armies_units
  belongs_to :battle_order
end
