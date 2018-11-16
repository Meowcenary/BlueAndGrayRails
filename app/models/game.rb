class Game < ApplicationRecord
  has_and_belongs_to_many :units

  has_many :scenarios
  has_many :campaigns
  has_many :battles
end
