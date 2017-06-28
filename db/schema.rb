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

ActiveRecord::Schema.define(version: 20170628051734) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.decimal  "opening_cash", precision: 12, scale: 2
    t.decimal  "opening_bank", precision: 12, scale: 2
    t.integer  "user_id"
    t.string   "bank"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.json     "image"
  end

  create_table "cash_purchases", force: :cascade do |t|
    t.string   "stock_description"
    t.integer  "user_id"
    t.json     "image"
    t.decimal  "amount",                       precision: 12, scale: 2
    t.decimal  "debit_purchase_cost_of_sales", precision: 12, scale: 2
    t.decimal  "credit_cash_current_asset",    precision: 12, scale: 2
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  create_table "credit_purchases", force: :cascade do |t|
    t.string   "stock_description"
    t.string   "creditor_name"
    t.integer  "user_id"
    t.decimal  "amount",            precision: 12, scale: 2
    t.json     "image"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "double_entry_account_balances", force: :cascade do |t|
    t.string   "account",    limit: 31, null: false
    t.string   "scope",      limit: 23
    t.integer  "balance",               null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["account"], name: "index_account_balances_on_account", using: :btree
    t.index ["scope", "account"], name: "index_account_balances_on_scope_and_account", unique: true, using: :btree
  end

  create_table "double_entry_line_aggregates", force: :cascade do |t|
    t.string   "function",   limit: 15, null: false
    t.string   "account",    limit: 31, null: false
    t.string   "code",       limit: 47
    t.string   "scope",      limit: 23
    t.integer  "year"
    t.integer  "month"
    t.integer  "week"
    t.integer  "day"
    t.integer  "hour"
    t.integer  "amount",                null: false
    t.string   "filter"
    t.string   "range_type", limit: 15, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["function", "account", "code", "year", "month", "week", "day"], name: "line_aggregate_idx", using: :btree
  end

  create_table "double_entry_line_checks", force: :cascade do |t|
    t.integer  "last_line_id", null: false
    t.boolean  "errors_found", null: false
    t.text     "log"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "double_entry_line_metadata", force: :cascade do |t|
    t.integer  "line_id",               null: false
    t.string   "key",        limit: 48, null: false
    t.string   "value",      limit: 64, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["line_id", "key", "value"], name: "lines_meta_line_id_key_value_idx", using: :btree
  end

  create_table "double_entry_lines", force: :cascade do |t|
    t.string   "account",         limit: 31, null: false
    t.string   "scope",           limit: 23
    t.string   "code",            limit: 47, null: false
    t.integer  "amount",                     null: false
    t.integer  "balance",                    null: false
    t.integer  "partner_id"
    t.string   "partner_account", limit: 31, null: false
    t.string   "partner_scope",   limit: 23
    t.integer  "detail_id"
    t.string   "detail_type"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["account", "code", "created_at"], name: "lines_account_code_created_at_idx", using: :btree
    t.index ["account", "created_at"], name: "lines_account_created_at_idx", using: :btree
    t.index ["scope", "account", "created_at"], name: "lines_scope_account_created_at_idx", using: :btree
    t.index ["scope", "account", "id"], name: "lines_scope_account_id_idx", using: :btree
  end

  create_table "lists", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "price",       precision: 8, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "user_id"
    t.json     "image"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "list_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "full_name"
    t.string   "business_type"
    t.string   "address"
    t.string   "company_name"
    t.integer  "company_no"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
