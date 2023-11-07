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

ActiveRecord::Schema[7.0].define(version: 2023_11_07_152101) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "genders", force: :cascade do |t|
    t.string "sex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sex"], name: "index_genders_on_sex", unique: true
  end

  create_table "watches", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.string "video"
    t.string "reference"
    t.string "collection"
    t.string "movement"
    t.string "caliber"
    t.string "powerReserve"
    t.date "dateAdded"
    t.string "dialColor"
    t.string "dialMaterial"
    t.string "caseSize"
    t.string "caseMaterial"
    t.string "caseBack"
    t.string "strapMaterial"
    t.string "strapColor"
    t.string "buckleType"
    t.string "specialFeatures"
    t.text "thumbnails", default: [], array: true
    t.text "images", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "gender_id", null: false
    t.index ["gender_id"], name: "index_watches_on_gender_id"
  end

  add_foreign_key "watches", "genders"
end
