class AddDiscordIdToPlayer < ActiveRecord::Migration[5.2]
  def change
    remove_index :players, :name
    remove_column :players, :name
    add_column :players, :discord_id, :bigint, null: false
    add_index :players, :discord_id, unique: true
  end
end
