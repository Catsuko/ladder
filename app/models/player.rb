class Player < ApplicationRecord
  validates :discord_id, presence: true

  def profile
    Profile.new(discord_id)
  end
end
