require 'rails_helper'

RSpec.describe Player, type: :model do
  describe '#create' do
    it 'cannot create two players with the same discord id' do
      discord_id = 12301230103
      existing_player = Player.create!(discord_id: discord_id)
      expect { Player.create!(discord_id: discord_id) }.to raise_error(ActiveRecord::RecordNotUnique)
    end

    it 'cannot create a player without a discord id' do
      expect { Player.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end