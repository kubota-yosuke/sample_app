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

ActiveRecord::Schema.define(version: 2023_01_06_135557) do

  create_table "chats", force: :cascade do |t|
    t.text "body", null: false
    t.integer "user_id", null: false
    t.integer "vehicle_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_chats_on_user_id"
    t.index ["vehicle_id"], name: "index_chats_on_vehicle_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "vehicle_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "vehicle_id"], name: "index_likes_on_user_id_and_vehicle_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
    t.index ["vehicle_id"], name: "index_likes_on_vehicle_id"
  end

  create_table "matchings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "vehicle_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_matchings_on_user_id"
    t.index ["vehicle_id"], name: "index_matchings_on_vehicle_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "vehicle_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_requests_on_user_id"
    t.index ["vehicle_id"], name: "index_requests_on_vehicle_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "vehicle_name"
    t.text "description"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "vehicle_image"
    t.index ["user_id"], name: "index_vehicles_on_user_id"
  end

  add_foreign_key "chats", "users"
  add_foreign_key "chats", "vehicles"
  add_foreign_key "likes", "users"
  add_foreign_key "likes", "vehicles"
  add_foreign_key "matchings", "users"
  add_foreign_key "matchings", "vehicles"
  add_foreign_key "requests", "users"
  add_foreign_key "requests", "vehicles"
  add_foreign_key "vehicles", "users"
end
