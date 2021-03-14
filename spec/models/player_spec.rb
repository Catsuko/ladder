require 'rails_helper'

RSpec.describe Player, type: :model do
  describe '#create' do
    it 'cannot create two players with the same name' do
      name = 'Lewis'
      existing_player = Player.create!(name: name)
      expect { Player.create!(name: name) }.to raise_error(ActiveRecord::RecordNotUnique)
    end

    it 'cannot create a player with no name' do
      expect { Player.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'cannot create a player with a blank name' do
      expect { Player.create!(name: '') }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end