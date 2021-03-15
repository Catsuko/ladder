class Player < ApplicationRecord
  validates :discord_id, presence: true
  validate :verify_discord_id, on: :create

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
