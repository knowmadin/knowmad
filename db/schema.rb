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

ActiveRecord::Schema.define(version: 20150707054220) do

  create_table "accounts", force: :cascade do |t|
    t.string   "subdomain",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "accounts", ["subdomain"], name: "index_accounts_on_subdomain", unique: true, using: :btree

  create_table "email_identities", force: :cascade do |t|
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
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "email_identities", ["confirmation_token"], name: "index_email_identities_on_confirmation_token", unique: true, using: :btree
  add_index "email_identities", ["email"], name: "index_email_identities_on_email", unique: true, using: :btree
  add_index "email_identities", ["reset_password_token"], name: "index_email_identities_on_reset_password_token", unique: true, using: :btree

  create_table "facebook_identities", force: :cascade do |t|
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       limit: 4,                  default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",  limit: 255
    t.string   "last_sign_in_ip",     limit: 255
    t.string   "email",               limit: 255
    t.string   "name",                limit: 255
    t.string   "first_name",          limit: 255
    t.string   "last_name",           limit: 255
    t.string   "profile_image_url",   limit: 255
    t.boolean  "verified",            limit: 1
    t.string   "token",               limit: 255
    t.datetime "expires_at"
    t.decimal  "facebook_id",                     precision: 10
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
  end

  add_index "facebook_identities", ["email"], name: "index_facebook_identities_on_email", unique: true, using: :btree

  create_table "google_identities", force: :cascade do |t|
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       limit: 4,   default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",  limit: 255
    t.string   "last_sign_in_ip",     limit: 255
    t.string   "email",               limit: 255
    t.string   "name",                limit: 255
    t.string   "first_name",          limit: 255
    t.string   "last_name",           limit: 255
    t.string   "profile_image_url",   limit: 255
    t.boolean  "verified",            limit: 1
    t.string   "token",               limit: 255
    t.datetime "expires_at"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "google_identities", ["email"], name: "index_google_identities_on_email", unique: true, using: :btree

  create_table "twitter_identities", force: :cascade do |t|
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       limit: 4,                  default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",  limit: 255
    t.string   "last_sign_in_ip",     limit: 255
    t.string   "screen_name",         limit: 255
    t.string   "name",                limit: 255
    t.string   "profile_image_url",   limit: 255
    t.boolean  "verified",            limit: 1
    t.string   "token",               limit: 255
    t.string   "secret",              limit: 255
    t.decimal  "twitter_id",                      precision: 10
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
  end

  add_index "twitter_identities", ["screen_name"], name: "index_twitter_identities_on_screen_name", unique: true, using: :btree

end
