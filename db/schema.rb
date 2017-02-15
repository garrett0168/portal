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

ActiveRecord::Schema.define(version: 20170206082325) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "ancestry",   limit: 255
  end

  add_index "categories", ["ancestry"], name: "index_categories_on_ancestry", using: :btree

  create_table "database_structures", force: :cascade do |t|
  end

  create_table "email_requests", force: :cascade do |t|
    t.string   "name",                      limit: 255
    t.string   "lo_name",                   limit: 255
    t.string   "email",                     limit: 255
    t.string   "event_date",                limit: 255
    t.string   "who_to_send_to",            limit: 255
    t.string   "frequency_and_time_of_day", limit: 255
    t.boolean  "existing_query"
    t.text     "exclusions",                limit: 65535
    t.string   "subject_line",              limit: 255
    t.string   "preheader_text",            limit: 255
    t.text     "desired_goal",              limit: 65535
    t.text     "detailed_description",      limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category",                  limit: 255
  end

  create_table "logos", force: :cascade do |t|
    t.string   "title",                 limit: 255
    t.text     "description",           limit: 65535
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "category_id",           limit: 4
    t.string   "document_file_name",    limit: 255
    t.string   "document_content_type", limit: 255
    t.integer  "document_file_size",    limit: 4
    t.datetime "document_updated_at"
  end

  create_table "reporting_informations", force: :cascade do |t|
    t.string   "username",   limit: 255
    t.string   "loan",       limit: 255
    t.string   "borrower",   limit: 255
    t.date     "funded"
    t.string   "type",       limit: 255
    t.string   "subject",    limit: 255
    t.string   "mailing",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "uploadable_items", force: :cascade do |t|
    t.string   "title",                 limit: 255
    t.text     "description",           limit: 65535
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "user_id",               limit: 4
    t.string   "document_file_name",    limit: 255
    t.string   "document_content_type", limit: 255
    t.integer  "document_file_size",    limit: 4
    t.datetime "document_updated_at"
    t.integer  "category_id",           limit: 4
    t.string   "type",                  limit: 255
  end

  create_table "uploadable_items_subcategories", force: :cascade do |t|
    t.integer  "uploadable_item_id", limit: 4, null: false
    t.integer  "category_id",        limit: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "uploadable_items_subcategories", ["category_id"], name: "index_uploadable_items_subcategories_on_category_id", using: :btree
  add_index "uploadable_items_subcategories", ["uploadable_item_id"], name: "index_uploadable_items_subcategories_on_uploadable_item_id", using: :btree

  create_table "user_devise_ldaps", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
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
  end

  add_index "user_devise_ldaps", ["reset_password_token"], name: "index_user_devise_ldaps_on_reset_password_token", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "name",                   limit: 255
    t.boolean  "admin",                              default: false
    t.string   "username",               limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
