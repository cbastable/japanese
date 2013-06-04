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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130604173123) do

  create_table "collections", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "collections", ["name"], :name => "index_collections_on_name"

  create_table "kanjis", :force => true do |t|
    t.string   "kanji"
    t.string   "onyomi"
    t.string   "kunyomi"
    t.string   "english"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lists", :force => true do |t|
    t.integer  "kanji_id"
    t.integer  "collection_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "lists", ["collection_id"], :name => "index_lists_on_collection_id"
  add_index "lists", ["kanji_id", "collection_id"], :name => "index_lists_on_kanji_id_and_collection_id", :unique => true
  add_index "lists", ["kanji_id"], :name => "index_lists_on_kanji_id"

end
