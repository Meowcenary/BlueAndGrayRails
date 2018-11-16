class Scenario < ApplicationRecord
  belongs_to :game
  has_many :battles
  has_one :battle_order
end
