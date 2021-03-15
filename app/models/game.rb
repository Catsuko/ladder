class Game < ApplicationRecord
  validates :name, presence: true

  has_many :titles, -> { order(:rank) }
end
