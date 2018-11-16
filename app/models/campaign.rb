class Campaign < ApplicationRecord
  belongs_to :game, optional: true
  has_many :battles
end
