class CreateTitles < ActiveRecord::Migration[5.2]
  def change
    create_table :titles do |t|
      t.string :name, null: false
      t.integer :rank, null: false
      t.belongs_to :game
      t.timestamps
    end

    add_index :titles, :rank
    add_index :titles, [:rank, :game_id], unique: true
  end
end
