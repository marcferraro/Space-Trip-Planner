# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_05_015620) do

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.float "temp"
    t.string "category"
    t.boolean "rings"
    t.boolean "fauna"
    t.boolean "flora"
    t.boolean "daytime"
    t.boolean "landable"
    t.boolean "visited"
    t.float "gravity_level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "traveller_trips", force: :cascade do |t|
    t.integer "trip_id"
    t.integer "traveller_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "travellers", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trip_locations", force: :cascade do |t|
    t.integer "trip_id"
    t.integer "location_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string "name"
    t.string "start_date"
    t.string "end_date"
    t.string "vehicle"
    t.string "status"
    t.text "log"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
