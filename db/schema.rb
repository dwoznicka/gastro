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

ActiveRecord::Schema.define(version: 20160104204202) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "street_name",      null: false
    t.string   "building_number",  null: false
    t.string   "apartment_number"
    t.string   "county"
    t.string   "postcode",         null: false
    t.string   "city",             null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "restaurant_id"
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "bookings", force: :cascade do |t|
    t.integer  "user_id",                     null: false
    t.integer  "table_id",                    null: false
    t.datetime "start_time",                  null: false
    t.datetime "end_time",                    null: false
    t.boolean  "confirmed",   default: false
    t.string   "description"
    t.boolean  "active",      default: false, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "bookings", ["table_id"], name: "index_bookings_on_table_id", using: :btree
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id", using: :btree

  create_table "dish_products", force: :cascade do |t|
    t.integer  "product_id",     null: false
    t.integer  "dish_id",        null: false
    t.float    "units_quantity", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "dish_products", ["dish_id"], name: "index_dish_products_on_dish_id", using: :btree
  add_index "dish_products", ["product_id"], name: "index_dish_products_on_product_id", using: :btree

  create_table "dishes", force: :cascade do |t|
    t.string   "description"
    t.float    "production_cost"
    t.float    "sell_price"
    t.integer  "calories"
    t.string   "allergy_advice"
    t.boolean  "vegan",           default: false, null: false
    t.boolean  "vegeterian",      default: false, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "floorplans", force: :cascade do |t|
    t.integer  "restaurant_id",             null: false
    t.integer  "floor",         default: 0, null: false
    t.string   "name"
    t.integer  "size_x",                    null: false
    t.integer  "size_y",                    null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "floorplans", ["restaurant_id"], name: "index_floorplans_on_restaurant_id", using: :btree

  create_table "menus", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.string   "name"
    t.boolean  "published",     default: false, null: false
    t.string   "description"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "menus", ["restaurant_id"], name: "index_menus_on_restaurant_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",        null: false
    t.float    "unit_cost",   null: false
    t.string   "unit",        null: false
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "roles", ["name"], name: "index_roles_on_name", unique: true, using: :btree

  create_table "tables", force: :cascade do |t|
    t.integer  "floorplan_id",             null: false
    t.string   "name",                     null: false
    t.integer  "capacity"
    t.integer  "x_position",   default: 0, null: false
    t.integer  "y_position",   default: 0, null: false
    t.integer  "x_size",       default: 1, null: false
    t.integer  "y_size",       default: 1, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "tables", ["floorplan_id"], name: "index_tables_on_floorplan_id", using: :btree

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "role_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_roles", ["role_id"], name: "index_user_roles_on_role_id", using: :btree
  add_index "user_roles", ["user_id"], name: "index_user_roles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.datetime "birthdate"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "workers", force: :cascade do |t|
    t.integer  "user_id",                       null: false
    t.integer  "restaurant_id",                 null: false
    t.boolean  "manager",       default: false, null: false
    t.boolean  "owner",         default: false, null: false
    t.float    "wage"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "workers", ["restaurant_id"], name: "index_workers_on_restaurant_id", using: :btree
  add_index "workers", ["user_id"], name: "index_workers_on_user_id", using: :btree

  add_foreign_key "addresses", "restaurants"
  add_foreign_key "addresses", "users"
  add_foreign_key "menus", "restaurants"
end
