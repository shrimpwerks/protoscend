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

ActiveRecord::Schema.define(version: 20160805165953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "Announcements", force: :cascade do |t|
    t.string "announcement", limit: 2000
  end

  create_table "AssignedRoutes", force: :cascade do |t|
    t.integer "sid",                                   null: false
    t.string  "gym",           limit: 510,             null: false
    t.string  "grade",         limit: 510,             null: false
    t.date    "creation_date",                         null: false
    t.integer "completed",                 default: 0
    t.integer "hidden",                    default: 0
  end

  create_table "AvailableWalls", force: :cascade do |t|
    t.string  "location",  limit: 510
    t.integer "wall_id",               null: false
    t.integer "available",             null: false
  end

  create_table "Comments", force: :cascade do |t|
    t.integer "rid",                              null: false
    t.integer "sid"
    t.string  "comment", limit: 1000
    t.integer "hidden",               default: 0
  end

  create_table "MaintenanceReports", force: :cascade do |t|
    t.integer "rid",                                   null: false
    t.string  "reason",       limit: 1000
    t.string  "note",         limit: 510
    t.integer "resolved",                  default: 0
    t.integer "priority"
    t.string  "submitted_by", limit: 200
    t.date    "submitted_at",                          null: false
  end

  create_table "Rating", force: :cascade do |t|
    t.integer "rid",    null: false
    t.integer "sid"
    t.integer "rating", null: false
  end

  create_table "Routes", force: :cascade do |t|
    t.string  "route_name",      limit: 510,             null: false
    t.integer "sid",                                     null: false
    t.string  "location",        limit: 510,             null: false
    t.string  "wall_name",       limit: 510
    t.integer "wid",                                     null: false
    t.string  "tape_color",      limit: 510,             null: false
    t.string  "grade",           limit: 510,             null: false
    t.date    "creation_date",                           null: false
    t.date    "expiration_date",                         null: false
    t.integer "hidden",                      default: 0
  end

  create_table "SmallGroups", force: :cascade do |t|
    t.string  "group_name", limit: 510,             null: false
    t.integer "hidden",                 default: 0
  end

  create_table "SupportTickets", force: :cascade do |t|
    t.integer  "sid",                     null: false
    t.string   "ticket",     limit: 4000
    t.datetime "created_at"
  end

  create_table "Users", force: :cascade do |t|
    t.string   "email",          limit: 510,             null: false
    t.string   "fname",          limit: 510,             null: false
    t.string   "lname",          limit: 510,             null: false
    t.string   "password",       limit: 510,             null: false
    t.integer  "user_level",                 default: 0
    t.integer  "gid"
    t.string   "remember_token", limit: 200
    t.datetime "updated_at"
    t.integer  "hidden",                     default: 0
  end

  create_table "announcements", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.datetime "expires_at"
    t.string   "subject"
    t.integer  "status",      default: 0
    t.integer  "user_id"
    t.datetime "reveal_date"
  end

  add_index "announcements", ["user_id"], name: "index_announcements_on_user_id", using: :btree

  create_table "assigned_routes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "gym"
    t.string   "grade"
    t.integer  "completed",  default: 0
    t.integer  "hidden",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
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
    t.integer  "status",                 default: 0
    t.integer  "priority",               default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "issue",                  default: 3
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "route_id"
    t.integer  "user_id"
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
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "status",               default: 0
    t.integer  "grade"
    t.string   "image_1_file_name"
    t.string   "image_1_content_type"
    t.integer  "image_1_file_size"
    t.datetime "image_1_updated_at"
    t.string   "image_2_file_name"
    t.string   "image_2_content_type"
    t.integer  "image_2_file_size"
    t.datetime "image_2_updated_at"
    t.text     "description"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                              default: "",    null: false
    t.string   "encrypted_password",                 default: "",    null: false
    t.integer  "role",                               default: 0
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.integer  "routes_count",                       default: 0
    t.integer  "announcements_count",                default: 0
    t.string   "confirmation_token",     limit: 128
    t.string   "remember_token",         limit: 128
    t.boolean  "is_deleted",                         default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
