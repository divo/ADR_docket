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

ActiveRecord::Schema.define(version: 2021_01_21_042132) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.text "tagline"
    t.string "phone"
    t.string "fax"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.text "address"
    t.float "lat"
    t.float "long"
    t.string "eircode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dockets", force: :cascade do |t|
    t.string "equipment_no"
    t.string "customer_reference_no"
    t.string "seal_no"
    t.text "description"
    t.text "return_empty"
    t.bigint "deliver_to_id"
    t.bigint "collect_from_id"
    t.bigint "hazardous_good_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "berth"
    t.string "size"
    t.string "weight"
    t.bigint "account_id"
    t.index ["account_id"], name: "index_dockets_on_account_id"
    t.index ["collect_from_id"], name: "index_dockets_on_collect_from_id"
    t.index ["deliver_to_id"], name: "index_dockets_on_deliver_to_id"
    t.index ["hazardous_good_id"], name: "index_dockets_on_hazardous_good_id"
  end

  create_table "hazardous_goods", force: :cascade do |t|
    t.string "name"
    t.integer "un_number"
    t.string "primary_class"
    t.string "secondary_class"
    t.string "packing_group"
    t.string "tunnel_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_users_on_account_id"
  end

  add_foreign_key "dockets", "hazardous_goods"
  add_foreign_key "users", "accounts"
end
