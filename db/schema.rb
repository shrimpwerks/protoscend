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

ActiveRecord::Schema.define(version: 20150813221233) do

  create_table "announcements", force: :cascade do |t|
    t.text     "announcement", limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "assigned_routes", force: :cascade do |t|
    t.integer  "users_id",   limit: 4
    t.string   "gym",        limit: 255
    t.string   "grade",      limit: 255
    t.integer  "completed",  limit: 4
    t.integer  "hidden",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "available_walls", force: :cascade do |t|
    t.string  "location",  limit: 255
    t.integer "wall_id",   limit: 4
    t.integer "available", limit: 4
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "routes_id",  limit: 4
    t.integer  "users_id",   limit: 4
    t.string   "comment",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "maintenance_requests", force: :cascade do |t|
    t.integer  "routes_id",  limit: 4
    t.integer  "users_id",   limit: 4
    t.string   "reason",     limit: 500
    t.integer  "resolved",   limit: 4,   default: 0
    t.integer  "priority",   limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "routes_id",  limit: 4
    t.integer  "users_id",   limit: 4
    t.integer  "rating",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "routes", force: :cascade do |t|
    t.string   "route_name",         limit: 255
    t.integer  "user_id",            limit: 4
    t.integer  "available_walls_id", limit: 4
    t.string   "location",           limit: 255
    t.string   "tape_color",         limit: 255
    t.string   "grade",              limit: 255
    t.date     "route_set_date"
    t.date     "expiration_date"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "small_groups", force: :cascade do |t|
    t.string   "group_name", limit: 255
    t.integer  "hidden",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "support_tickets", force: :cascade do |t|
    t.integer  "users_id",   limit: 4
    t.string   "ticket",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "fname",                  limit: 255
    t.string   "lname",                  limit: 255
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.integer  "user_level",             limit: 4
    t.integer  "small_groups_id",        limit: 4
    t.integer  "hidden",                 limit: 4
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "auth_token",             limit: 255, default: ""
    t.integer  "route_count",            limit: 4,   default: 0
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
