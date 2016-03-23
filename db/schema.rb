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

ActiveRecord::Schema.define(version: 20160322185638) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.text     "announcement"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "assigned_routes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "gym"
    t.string   "grade"
    t.integer  "completed",  default: 0
    t.integer  "hidden",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "available_walls", force: :cascade do |t|
    t.string  "location"
    t.integer "wall_id"
    t.integer "available", default: 1
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "route_id"
    t.integer  "user_id"
    t.string   "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maintenance_requests", force: :cascade do |t|
    t.integer  "route_id"
    t.integer  "user_id"
    t.string   "reason",     limit: 500
    t.integer  "resolved",               default: 0
    t.integer  "priority",               default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "issue",                  default: 3
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "routes_id"
    t.integer  "users_id"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "label"
    t.string   "location"
    t.string   "tape_color"
    t.date     "route_set_date"
    t.date     "expiration_date"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "image_1",         default: ""
    t.string   "image_2",         default: ""
    t.integer  "status",          default: 0
    t.integer  "grade"
  end

  create_table "support_tickets", force: :cascade do |t|
    t.integer  "users_id"
    t.string   "ticket"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.integer  "role",                   default: 1
    t.integer  "hidden"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "routes_count",           default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
