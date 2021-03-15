class Game < ApplicationRecord
  validates :name, presence: true

  has_many :titles, -> { order(:rank) }
  has_many :matches, -> { order(updated_at: :desc) }
end
