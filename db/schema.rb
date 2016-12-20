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

ActiveRecord::Schema.define(version: 20161220181139) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "park_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["park_id", "user_id"], name: "index_favorites_on_park_id_and_user_id", unique: true, using: :btree
  end

  create_table "parks", force: :cascade do |t|
    t.float   "acreage"
    t.string  "location_type"
    t.string  "location_coordinates"
    t.integer "parkid"
    t.string  "parkname"
    t.string  "parktype"
    t.integer "supdist"
    t.integer "zipcode"
    t.float   "evaluation"
    t.index ["parkname"], name: "index_parks_on_parkname", using: :btree
  end

  create_table "pois", force: :cascade do |t|
    t.integer  "zipcode",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["zipcode", "user_id"], name: "index_pois_on_zipcode_and_user_id", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      null: false
    t.string   "email",           null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest", null: false
    t.string   "auth_token"
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

end
