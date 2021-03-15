class Title < ApplicationRecord
  validates :rank, :name, :game, presence: true
  validates :rank, numericality: { greater_than: 0 }

  belongs_to :game

  def self.next_free_rank
    (last&.rank || 0).next
  end
end
