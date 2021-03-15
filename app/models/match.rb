class Match < ApplicationRecord
  belongs_to :game

  has_many :match_players
  has_many :players, through: :match_players

  accepts_nested_attributes_for :match_players

  validates :match_players, length: { minimum: 2 }
end