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

ActiveRecord::Schema.define(version: 20200420150815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "road_trip_travelers", force: :cascade do |t|
    t.bigint "road_trip_id"
    t.bigint "traveler_id"
    t.index ["road_trip_id"], name: "index_road_trip_travelers_on_road_trip_id"
    t.index ["traveler_id"], name: "index_road_trip_travelers_on_traveler_id"
  end

  create_table "road_trips", force: :cascade do |t|
    t.string "title"
    t.string "destination"
    t.integer "mileage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "travelers", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "road_trip_travelers", "road_trips"
  add_foreign_key "road_trip_travelers", "travelers"
end
