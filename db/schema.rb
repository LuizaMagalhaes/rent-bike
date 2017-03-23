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

ActiveRecord::Schema.define(version: 20170323201507) do

  create_table "advertisements", force: :cascade do |t|
    t.string   "title"
    t.string   "address"
    t.decimal  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "owner"
    t.string   "phone"
  end

  create_table "bikes", force: :cascade do |t|
    t.string   "color"
    t.string   "weel_size"
    t.string   "condition"
    t.string   "category"
    t.string   "use_for"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "advertisement_id"
    t.index ["advertisement_id"], name: "index_bikes_on_advertisement_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "cpf"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rents", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "advertisement_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "rent_date"
    t.string   "payment"
    t.decimal  "price"
    t.index ["advertisement_id"], name: "index_rents_on_advertisement_id"
    t.index ["customer_id"], name: "index_rents_on_customer_id"
  end

end
