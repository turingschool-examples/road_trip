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

ActiveRecord::Schema.define(version: 20200420152923) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "traveler_trips", force: :cascade do |t|
    t.bigint "trip_id"
    t.bigint "traveler_id"
    t.index ["traveler_id"], name: "index_traveler_trips_on_traveler_id"
    t.index ["trip_id"], name: "index_traveler_trips_on_trip_id"
  end

  create_table "travelers", force: :cascade do |t|
    t.string "name"
    t.string "age"
    t.bigint "trips_id"
    t.index ["trips_id"], name: "index_travelers_on_trips_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "title"
    t.string "city"
    t.integer "milage"
    t.bigint "travelers_id"
    t.index ["travelers_id"], name: "index_trips_on_travelers_id"
  end

  add_foreign_key "traveler_trips", "travelers"
  add_foreign_key "traveler_trips", "trips"
  add_foreign_key "travelers", "trips", column: "trips_id"
  add_foreign_key "trips", "travelers", column: "travelers_id"
end
