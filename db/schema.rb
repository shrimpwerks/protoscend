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

ActiveRecord::Schema.define(version: 20160130203832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.text     "announcement"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "assigned_routes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "gym",        limit: 255
    t.string   "grade",      limit: 255
    t.integer  "completed",              default: 0
    t.integer  "hidden",                 default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "available_walls", force: :cascade do |t|
    t.string  "location",  limit: 255
    t.integer "wall_id"
    t.integer "available",             default: 1
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "routes_id"
    t.integer  "users_id"
    t.string   "comment",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "maintenance_requests", force: :cascade do |t|
    t.integer  "routes_id"
    t.integer  "users_id"
    t.string   "reason",     limit: 500
    t.integer  "resolved",               default: 0
    t.integer  "priority"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "routes_id"
    t.integer  "users_id"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.integer  "user_id"
    t.integer  "available_walls_id"
    t.string   "location",           limit: 255
    t.string   "tape_color",         limit: 255
    t.string   "grade",              limit: 255
    t.date     "route_set_date"
    t.date     "expiration_date"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "image_1",                        default: ""
    t.string   "image_2",                        default: ""
    t.integer  "hidden",                         default: 0
  end

  create_table "small_groups", force: :cascade do |t|
    t.string   "group_name", limit: 255
    t.integer  "hidden"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "support_tickets", force: :cascade do |t|
    t.integer  "users_id"
    t.string   "ticket",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "fname",                  limit: 255
    t.string   "lname",                  limit: 255
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.integer  "user_level",                         default: 1
    t.integer  "small_groups_id"
    t.integer  "hidden"
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "routes_count",                       default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
