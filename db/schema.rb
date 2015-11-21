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

ActiveRecord::Schema.define(version: 20151121190114) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string   "country_code"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "med_table_entries", force: :cascade do |t|
    t.integer  "med_table_id"
    t.integer  "medicine_id"
    t.string   "instruction"
    t.string   "duration"
    t.string   "morning"
    t.string   "afternoon"
    t.string   "evening"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "med_tables", force: :cascade do |t|
    t.integer  "patient_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "from_template", default: false
    t.date     "pre_date"
    t.integer  "template_id"
    t.boolean  "printed"
  end

  create_table "medicines", force: :cascade do |t|
    t.string   "name"
    t.boolean  "availability"
    t.integer  "quantity"
    t.string   "usage"
    t.string   "side_effects"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "m_type"
    t.string   "category"
  end

  add_index "medicines", ["name", "m_type"], name: "index_medicines_on_name_and_m_type", unique: true, using: :btree

  create_table "patients", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.date     "first_check_in"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "phone_number"
  end

  create_table "templates", force: :cascade do |t|
    t.string   "name"
    t.string   "symptoms"
    t.string   "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
