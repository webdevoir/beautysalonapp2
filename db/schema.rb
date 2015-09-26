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

ActiveRecord::Schema.define(version: 20150926092258) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "slug", limit: 255
  end

  add_index "categories", ["slug"], name: "index_categories_on_slug", unique: true, using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",               null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description"
    t.string   "image",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "promotions", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.string   "tagline",     limit: 255
    t.text     "description"
    t.string   "image",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "visible"
    t.decimal  "price",                   precision: 8, scale: 2
    t.text     "summary"
    t.string   "slug",        limit: 255
  end

  add_index "promotions", ["slug"], name: "index_promotions_on_slug", unique: true, using: :btree

  create_table "sections", force: :cascade do |t|
    t.string  "title",       limit: 255
    t.text    "description"
    t.string  "image",       limit: 255
    t.integer "category_id"
    t.integer "position"
  end

  add_index "sections", ["category_id"], name: "index_sections_on_category_id", using: :btree

  create_table "treatments", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.string   "tagline",     limit: 255
    t.text     "summary"
    t.text     "description"
    t.decimal  "price",                   precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image",       limit: 255
    t.integer  "category_id"
    t.string   "slug",        limit: 255
    t.integer  "position"
    t.boolean  "visible"
  end

  add_index "treatments", ["category_id"], name: "index_treatments_on_category_id", using: :btree
  add_index "treatments", ["slug"], name: "index_treatments_on_slug", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string  "name",            limit: 255
    t.string  "email",           limit: 255
    t.string  "password_digest", limit: 255
    t.boolean "admin"
  end

end
