class Battle < ApplicationRecord
  belongs_to :game
  belongs_to :scenario
  belongs_to :campaign, optional: true

  has_many :armies
end
