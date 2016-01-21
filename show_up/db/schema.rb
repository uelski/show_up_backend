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

ActiveRecord::Schema.define(version: 20160121213625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bands", force: :cascade do |t|
    t.string   "band_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "band_website"
    t.string   "photo_link"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "bands_shows", id: false, force: :cascade do |t|
    t.integer "band_id"
    t.integer "show_id"
  end

  add_index "bands_shows", ["band_id"], name: "index_bands_shows_on_band_id", using: :btree
  add_index "bands_shows", ["show_id"], name: "index_bands_shows_on_show_id", using: :btree

  create_table "shows", force: :cascade do |t|
    t.string   "title"
    t.date     "date"
    t.string   "poster_link"
    t.integer  "venue_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "shows", ["venue_id"], name: "index_shows_on_venue_id", using: :btree

  create_table "venues", force: :cascade do |t|
    t.string   "venue_name"
    t.string   "address"
    t.string   "venue_website"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
