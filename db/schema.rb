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

ActiveRecord::Schema.define(version: 2021_06_05_230828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "zip", null: false
    t.string "street", null: false
    t.string "state"
    t.string "city"
    t.string "neighborhood"
    t.string "complement"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["zip"], name: "index_addresses_on_zip", unique: true
  end

  create_table "addresses_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "address_id", null: false
    t.index ["address_id", "user_id"], name: "index_addresses_users_on_address_id_and_user_id"
    t.index ["user_id", "address_id"], name: "index_addresses_users_on_user_id_and_address_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
