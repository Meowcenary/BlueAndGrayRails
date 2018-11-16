class BattleOrder < ApplicationRecord
  has_and_belongs_to_many :units
  has_many :armies
  belongs_to :scenario
end
