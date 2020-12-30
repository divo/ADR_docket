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

ActiveRecord::Schema.define(version: 2020_12_30_002459) do

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
    t.boolean "return_empty"
    t.integer "deliver_to_id"
    t.integer "collect_from_id"
    t.integer "hazardous_good_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "berth"
    t.string "size"
    t.string "weight"
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

end
