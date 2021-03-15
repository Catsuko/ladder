class Player < ApplicationRecord
  validates :discord_id, presence: true
  validate :verify_discord_id, on: :create

  has_many :match_players
  has_many :matches, through: :match_players
  has_many :games, through: :matches

  def profile
    Profile.new(discord_id)
  end

private

  def verify_discord_id
    profile.name
  rescue
    errors.add(:discord_id, 'Invalid discord id')
  end
end
