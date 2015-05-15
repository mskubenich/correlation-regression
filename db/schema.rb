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

ActiveRecord::Schema.define(version: 20150515105240) do

  create_table "children", force: :cascade do |t|
    t.integer  "skt_level",    limit: 4
    t.string   "integer",      limit: 255
    t.integer  "age",          limit: 4
    t.string   "sex",          limit: 255
    t.string   "name",         limit: 255
    t.boolean  "zhyvit",       limit: 1
    t.boolean  "stul",         limit: 1
    t.boolean  "uzd",          limit: 1
    t.boolean  "fpk",          limit: 1
    t.boolean  "disbakterioz", limit: 1
    t.boolean  "spadkovist",   limit: 1
    t.boolean  "spadk_line1",  limit: 1
    t.boolean  "spadk_line2",  limit: 1
    t.boolean  "both_parents", limit: 1
    t.boolean  "both_lines",   limit: 1
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
