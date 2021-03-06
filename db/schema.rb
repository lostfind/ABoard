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

ActiveRecord::Schema.define(version: 2018_09_02_125517) do

  create_table "forums", primary_key: "forum_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "forum_nm", limit: 1000, null: false
    t.string "detail", limit: 1000
    t.integer "parent_forum_id"
    t.datetime "create_dttm", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "post_likes", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "post_id", default: 0, null: false
    t.string "user_ip", limit: 100, default: "", null: false
    t.index ["post_id", "user_ip"], name: "post_likes_IDX", unique: true
  end

  create_table "posts", primary_key: "post_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "forum_id", null: false
    t.string "title", limit: 1000, null: false
    t.string "post_user_id", limit: 15, null: false
    t.string "password", limit: 100, null: false
    t.string "content", limit: 4000, null: false
    t.decimal "like_cnt", precision: 10, default: "0", null: false
    t.datetime "write_dttm", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "modify_dttm", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.date "close_dttm"
  end

  create_table "replies", primary_key: "reply_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "quote_reply_id"
    t.integer "lvl", default: 1, null: false
    t.string "user_id", limit: 15, null: false
    t.string "password", limit: 100, null: false
    t.string "content", limit: 4000, null: false
    t.datetime "write_dttm", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "modify_dttm", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "reply_likes", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "reply_id", null: false
    t.string "user_ip", limit: 100, null: false
    t.index ["reply_id", "user_ip"], name: "reply_likes_IDX", unique: true
  end

end
