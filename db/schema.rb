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

ActiveRecord::Schema.define(version: 2021_10_17_020510) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "acct_name"
    t.boolean "has_money"
    t.integer "dollar_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_accounts_on_customer_id"
  end

  create_table "channels", force: :cascade do |t|
    t.string "name"
    t.integer "cost"
    t.boolean "spanish"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.boolean "active_account"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscribers", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.boolean "top_market"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "channel_id"
    t.index ["channel_id"], name: "index_subscribers_on_channel_id"
  end

  add_foreign_key "accounts", "customers"
  add_foreign_key "subscribers", "channels"
end
