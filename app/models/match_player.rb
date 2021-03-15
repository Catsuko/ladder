class MatchPlayer < ApplicationRecord
  belongs_to :match
  belongs_to :player

  validates :rank, presence: true, numericality: { greater_than: 0 }

  default_scope { order(rank: :asc) }
end