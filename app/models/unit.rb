class Unit < ApplicationRecord
  has_and_belongs_to_many :games
  has_and_belongs_to_many :armies
  has_and_belongs_to_many :battle_orders

  has_many :armies_units

  enum type_of: [:infantry, :cavalry, :artillery]
end
