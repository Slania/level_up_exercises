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

ActiveRecord::Schema.define(version: 20140922220252) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "channel_last_fetched", id: false, force: true do |t|
    t.integer  "channel_id"
    t.decimal  "latest_ts"
    t.decimal  "oldest_ts"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "channels", force: true do |t|
    t.string   "slack_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "type"
    t.decimal  "ts"
    t.text     "text"
    t.float    "score"
    t.integer  "user_id"
    t.integer  "channel_id"
    t.integer  "time_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "timestamp"
  end

  create_table "staging", id: false, force: true do |t|
    t.string   "type"
    t.decimal  "ts"
    t.text     "text"
    t.float    "score"
    t.integer  "user_id"
    t.integer  "channel_id"
    t.datetime "timestamp"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "slack_id"
    t.string   "real_name"
    t.string   "email"
    t.text     "avatar_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
