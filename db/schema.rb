# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_15_133906) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_games_on_name", unique: true
  end

  create_table "match_players", force: :cascade do |t|
    t.bigint "match_id"
    t.bigint "player_id"
    t.integer "rank", null: false
    t.index ["match_id", "player_id"], name: "index_match_players_on_match_id_and_player_id", unique: true
    t.index ["match_id"], name: "index_match_players_on_match_id"
    t.index ["player_id", "rank"], name: "index_match_players_on_player_id_and_rank"
    t.index ["player_id"], name: "index_match_players_on_player_id"
    t.index ["rank"], name: "index_match_players_on_rank"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_matches_on_game_id"
  end

  create_table "players", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "discord_id", null: false
    t.index ["discord_id"], name: "index_players_on_discord_id", unique: true
  end

  create_table "titles", force: :cascade do |t|
    t.string "name", null: false
    t.integer "rank", null: false
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_titles_on_game_id"
    t.index ["rank", "game_id"], name: "index_titles_on_rank_and_game_id", unique: true
    t.index ["rank"], name: "index_titles_on_rank"
  end

end
