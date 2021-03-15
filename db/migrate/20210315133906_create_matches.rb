class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.belongs_to :game
      t.timestamps
    end

    create_table :match_players do |t|
      t.belongs_to :match
      t.belongs_to :player
      t.integer :rank, null: false
    end

    add_index :match_players, [:match_id, :player_id], unique: true
    add_index :match_players, [:rank]
    add_index :match_players, [:player_id, :rank]
  end
end
