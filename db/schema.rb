# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150201125549) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "impressions", force: :cascade do |t|
    t.integer  "video_id"
    t.integer  "user_id"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "impressions", ["type"], name: "index_impressions_on_type", using: :btree
  add_index "impressions", ["user_id", "video_id"], name: "index_impressions_on_user_id_and_video_id", unique: true, using: :btree
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree
  add_index "impressions", ["video_id"], name: "index_impressions_on_video_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "slug"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pages", ["slug"], name: "index_pages_on_slug", unique: true, using: :btree

  create_table "references", force: :cascade do |t|
    t.integer  "video_id"
    t.string   "title"
    t.text     "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "references", ["video_id"], name: "index_references_on_video_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "nickname"
    t.string   "email"
    t.string   "name"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", using: :btree

  create_table "videos", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "video_url"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "slug"
    t.integer  "user_id"
    t.string   "type"
    t.integer  "likes_count",    default: 0
    t.integer  "dislikes_count", default: 0
  end

  add_index "videos", ["slug"], name: "index_videos_on_slug", unique: true, using: :btree
  add_index "videos", ["type"], name: "index_videos_on_type", using: :btree
  add_index "videos", ["user_id"], name: "index_videos_on_user_id", using: :btree
  add_index "videos", ["video_url"], name: "index_videos_on_video_url", unique: true, using: :btree

  add_foreign_key "impressions", "users"
  add_foreign_key "impressions", "videos"
  add_foreign_key "references", "videos"
  add_foreign_key "videos", "users"
end
