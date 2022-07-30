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

ActiveRecord::Schema.define(version: 2022_10_15_230650) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "post_id"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "communities", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.text "rules"
    t.integer "total_members"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "summary"
    t.index ["user_id"], name: "index_communities_on_user_id"
  end

  create_table "medicines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "community_id"
    t.string "title"
    t.text "body"
    t.integer "upvotes", default: 0
    t.integer "downvotes", default: 0
    t.integer "total_comments", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_posts_on_community_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prescriptiontypes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "record_prescription_types", force: :cascade do |t|
    t.bigint "record_id"
    t.bigint "prescriptiontype_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prescriptiontype_id"], name: "index_record_prescription_types_on_prescriptiontype_id"
    t.index ["record_id"], name: "index_record_prescription_types_on_record_id"
  end

  create_table "record_prescriptions", force: :cascade do |t|
    t.bigint "record_id"
    t.bigint "prescription_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prescription_id"], name: "index_record_prescriptions_on_prescription_id"
    t.index ["record_id"], name: "index_record_prescriptions_on_record_id"
  end

  create_table "record_tests", force: :cascade do |t|
    t.bigint "record_id"
    t.bigint "test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_id"], name: "index_record_tests_on_record_id"
    t.index ["test_id"], name: "index_record_tests_on_test_id"
  end

  create_table "record_xrays", force: :cascade do |t|
    t.bigint "record_id"
    t.bigint "xray_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_id"], name: "index_record_xrays_on_record_id"
    t.index ["xray_id"], name: "index_record_xrays_on_xray_id"
  end

  create_table "records", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "medicine_id"
    t.string "description"
    t.string "description_other"
    t.string "name_other"
    t.string "doctor"
    t.string "prescription_name"
    t.text "comment"
    t.string "rating"
    t.datetime "date"
    t.string "photo"
    t.string "vaccine"
    t.string "vaccine_other"
    t.index ["medicine_id"], name: "index_records_on_medicine_id"
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "community_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_subscriptions_on_community_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "state"
    t.string "city"
    t.boolean "business", default: false
    t.string "birthdate"
    t.boolean "developer", default: false
    t.integer "karma", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "post_id"
    t.boolean "upvote"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_votes_on_post_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  create_table "xrays", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "record_prescription_types", "prescriptiontypes"
  add_foreign_key "record_prescription_types", "records"
  add_foreign_key "record_prescriptions", "prescriptions"
  add_foreign_key "record_prescriptions", "records"
  add_foreign_key "record_tests", "records"
  add_foreign_key "record_tests", "tests"
  add_foreign_key "record_xrays", "records"
  add_foreign_key "record_xrays", "xrays"
  add_foreign_key "records", "medicines"
  add_foreign_key "records", "users"
end
