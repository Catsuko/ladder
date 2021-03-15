class Title < ApplicationRecord
  validates :rank, :name, :game, presence: true

  belongs_to :game

  def self.next_free_rank
    (last&.rank || 0).next
  end
end
