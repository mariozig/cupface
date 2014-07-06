# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140706184017) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "faces", force: true do |t|
    t.integer  "match_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "game_minute"
    t.string   "comment"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "faceable_id"
    t.string   "faceable_type"
  end

  add_index "faces", ["faceable_id"], name: "index_faces_on_faceable_id", using: :btree
  add_index "faces", ["match_id"], name: "index_faces_on_match_id", using: :btree

  create_table "matches", force: true do |t|
    t.integer  "home_score"
    t.integer  "away_score"
    t.integer  "current_game_minute"
    t.datetime "start_time"
    t.string   "kimono_home_team_id"
    t.string   "kimono_away_team_id"
    t.string   "status"
    t.string   "venue"
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kimono_id"
    t.string   "group"
  end

  add_index "matches", ["away_team_id"], name: "index_matches_on_away_team_id", using: :btree
  add_index "matches", ["home_team_id"], name: "index_matches_on_home_team_id", using: :btree

  create_table "pictures", force: true do |t|
    t.string   "name"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "pictures", ["imageable_id", "imageable_type"], name: "index_pictures_on_imageable_id_and_imageable_type", using: :btree

  create_table "players", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
    t.string   "nationality"
    t.integer  "age"
    t.datetime "birth_date"
    t.string   "birth_country"
    t.string   "birth_city"
    t.string   "position"
    t.string   "foot"
    t.string   "image"
    t.integer  "height_cm"
    t.integer  "weight_kg"
    t.integer  "goals"
    t.integer  "own_goals"
    t.integer  "penalty_goals"
    t.integer  "assists"
    t.string   "kimono_team_id"
    t.string   "kimono_club_id"
    t.string   "kimono_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
  end

  add_index "players", ["team_id"], name: "index_players_on_team_id", using: :btree

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "logo"
    t.string   "website"
    t.integer  "founded_year"
    t.string   "address"
    t.string   "home_stadium"
    t.integer  "stadium_capacity"
    t.string   "group"
    t.integer  "group_rank"
    t.integer  "group_points"
    t.integer  "matches_played"
    t.integer  "wins"
    t.integer  "losses"
    t.integer  "draws"
    t.integer  "goals_for"
    t.integer  "goals_against"
    t.integer  "goals_diff"
    t.string   "kimono_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
