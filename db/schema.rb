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

ActiveRecord::Schema.define(version: 20150211204212) do

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "pages", force: :cascade do |t|
    t.integer  "section_id",                limit: 4
    t.string   "title",                     limit: 255,   null: false
    t.text     "excerpt",                   limit: 65535
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "header_iamge_file_name",    limit: 255
    t.string   "header_iamge_content_type", limit: 255
    t.integer  "header_iamge_file_size",    limit: 4
    t.datetime "header_iamge_updated_at"
  end

  add_index "pages", ["section_id", "title"], name: "index_pages_on_section_id_and_title", unique: true, using: :btree

  create_table "sections", force: :cascade do |t|
    t.integer  "website_id",                limit: 4
    t.string   "name",                      limit: 255,   null: false
    t.text     "description",               limit: 65535
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "header_image_file_name",    limit: 255
    t.string   "header_image_content_type", limit: 255
    t.integer  "header_image_file_size",    limit: 4
    t.datetime "header_image_updated_at"
  end

  add_index "sections", ["website_id", "name"], name: "index_sections_on_website_id_and_name", unique: true, using: :btree

  create_table "websites", force: :cascade do |t|
    t.string   "domain",     limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
