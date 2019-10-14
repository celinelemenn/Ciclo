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

ActiveRecord::Schema.define(version: 2019_10_14_183348) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "point_of_interest_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["point_of_interest_id"], name: "index_bookmarks_on_point_of_interest_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "point_of_interest_id"
    t.bigint "user_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["point_of_interest_id"], name: "index_comments_on_point_of_interest_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "author_id"
    t.integer "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id", "receiver_id"], name: "index_conversations_on_author_id_and_receiver_id", unique: true
    t.index ["author_id"], name: "index_conversations_on_author_id"
    t.index ["receiver_id"], name: "index_conversations_on_receiver_id"
  end

  create_table "downvotes", force: :cascade do |t|
    t.bigint "point_of_interest_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["point_of_interest_id"], name: "index_downvotes_on_point_of_interest_id"
    t.index ["user_id"], name: "index_downvotes_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "point_of_interest_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["point_of_interest_id"], name: "index_likes_on_point_of_interest_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "personal_messages", force: :cascade do |t|
    t.text "body"
    t.bigint "conversation_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_personal_messages_on_conversation_id"
    t.index ["user_id"], name: "index_personal_messages_on_user_id"
  end

  create_table "point_of_interests", force: :cascade do |t|
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "long", precision: 10, scale: 6
    t.integer "poi_type"
    t.string "description"
    t.bigint "user_id"
    t.boolean "published", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "title"
    t.index ["user_id"], name: "index_point_of_interests_on_user_id"
  end

  create_table "preferences", force: :cascade do |t|
    t.bigint "user_id"
    t.boolean "water_refill", default: true
    t.boolean "camping", default: true
    t.boolean "caution", default: true
    t.boolean "landmark", default: true
    t.boolean "cyclists", default: true
    t.boolean "bookmarks", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "hotel", default: true
    t.boolean "toilet", default: true
    t.boolean "wild_camping", default: true
    t.boolean "bar", default: true
    t.boolean "shopping", default: true
    t.boolean "wifi", default: true
    t.boolean "picnic", default: true
    t.boolean "repair", default: true
    t.boolean "info_point", default: true
    t.boolean "electricity", default: true
    t.boolean "resto", default: true
    t.index ["user_id"], name: "index_preferences_on_user_id"
  end

  create_table "reports", force: :cascade do |t|
    t.bigint "point_of_interest_id"
    t.bigint "user_id"
    t.integer "issue_type"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["point_of_interest_id"], name: "index_reports_on_point_of_interest_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "trips", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "name"
    t.integer "km"
    t.string "blog"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "country_code"
    t.string "cycling_route"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "user_positions", force: :cascade do |t|
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "long", precision: 10, scale: 6
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_positions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name"
    t.string "bio"
    t.text "description"
    t.string "photo"
    t.boolean "share_location"
    t.string "blog"
    t.boolean "status", default: false
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookmarks", "point_of_interests"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "comments", "point_of_interests"
  add_foreign_key "comments", "users"
  add_foreign_key "downvotes", "point_of_interests"
  add_foreign_key "downvotes", "users"
  add_foreign_key "likes", "point_of_interests"
  add_foreign_key "likes", "users"
  add_foreign_key "personal_messages", "conversations"
  add_foreign_key "personal_messages", "users"
  add_foreign_key "point_of_interests", "users"
  add_foreign_key "preferences", "users"
  add_foreign_key "reports", "point_of_interests"
  add_foreign_key "reports", "users"
  add_foreign_key "trips", "users"
  add_foreign_key "user_positions", "users"
end
