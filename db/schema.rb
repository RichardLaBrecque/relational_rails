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

ActiveRecord::Schema.define(version: 2022_02_04_025130) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.boolean "recent_visit"
    t.integer "required_visits_per_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "contractor_id"
    t.index ["contractor_id"], name: "index_clients_on_contractor_id"
  end

  create_table "contractors", force: :cascade do |t|
    t.string "name"
    t.boolean "licensed"
    t.integer "service_cost"
    t.integer "service_area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "houses", force: :cascade do |t|
    t.string "family_name"
    t.boolean "hos_member"
    t.integer "parking_spaces"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "neighborhood_id"
    t.index ["neighborhood_id"], name: "index_houses_on_neighborhood_id"
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string "name"
    t.boolean "has_pool"
    t.integer "number_of_streets"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "clients", "contractors"
  add_foreign_key "houses", "neighborhoods"
end
