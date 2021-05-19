# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_19_010257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contracts", force: :cascade do |t|
    t.bigint "occupant_id", null: false
    t.bigint "unit_id", null: false
    t.date "move_in"
    t.date "move_out"
    t.index ["occupant_id"], name: "index_contracts_on_occupant_id"
    t.index ["unit_id"], name: "index_contracts_on_unit_id"
  end

  create_table "occupants", force: :cascade do |t|
    t.string "name"
  end

  create_table "units", force: :cascade do |t|
    t.string "number"
    t.string "floor_plan"
  end

  add_foreign_key "contracts", "occupants"
  add_foreign_key "contracts", "units"
end
