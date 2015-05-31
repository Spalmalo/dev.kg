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

ActiveRecord::Schema.define(version: 20150531103459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "asciicasts", force: :cascade do |t|
    t.integer  "video_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "asciicasts", ["video_id"], name: "index_asciicasts_on_video_id", using: :btree

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

  create_table "snippets", force: :cascade do |t|
    t.integer  "video_id"
    t.string   "description"
    t.integer  "language"
    t.text     "code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "snippets", ["video_id"], name: "index_snippets_on_video_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "nickname"
    t.string   "email"
    t.string   "name"
    t.string   "image"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "role",       default: 0
  end

  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

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
    t.datetime "published_at"
    t.datetime "deleted_at"
  end

  add_index "videos", ["deleted_at"], name: "index_videos_on_deleted_at", using: :btree
  add_index "videos", ["slug"], name: "index_videos_on_slug", unique: true, using: :btree
  add_index "videos", ["type"], name: "index_videos_on_type", using: :btree
  add_index "videos", ["user_id"], name: "index_videos_on_user_id", using: :btree
  add_index "videos", ["video_url"], name: "index_videos_on_video_url", unique: true, using: :btree

  add_foreign_key "asciicasts", "videos"
  add_foreign_key "impressions", "users"
  add_foreign_key "impressions", "videos"
  add_foreign_key "references", "videos"
  add_foreign_key "snippets", "videos"
  add_foreign_key "videos", "users"
end
