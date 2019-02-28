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

ActiveRecord::Schema.define(version: 2019_02_28_193053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.string "status"
    t.string "car_plate"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "price_cents"
    t.bigint "parking_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parking_id"], name: "index_bookings_on_parking_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parking_lot_features", force: :cascade do |t|
    t.bigint "parking_id"
    t.bigint "feature_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_parking_lot_features_on_feature_id"
    t.index ["parking_id"], name: "index_parking_lot_features_on_parking_id"
  end

  create_table "parkings", force: :cascade do |t|
    t.text "description"
    t.string "name"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "size"
    t.string "price_cents"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "pictures"
    t.index ["user_id"], name: "index_parkings_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.integer "rating"
    t.string "date"
    t.string "picture"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "parkings"
  add_foreign_key "bookings", "users"
  add_foreign_key "parking_lot_features", "features"
  add_foreign_key "parking_lot_features", "parkings"
  add_foreign_key "parkings", "users"
  add_foreign_key "reviews", "bookings"
end
