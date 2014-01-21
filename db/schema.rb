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

ActiveRecord::Schema.define(version: 20140121011649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "collections", ["name"], name: "index_collections_on_name", using: :btree

  create_table "custom_collections", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "custom_collections", ["name"], name: "index_custom_collections_on_name", using: :btree

  create_table "custom_lists", force: true do |t|
    t.integer  "kanji_id"
    t.integer  "custom_collection_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "custom_lists", ["custom_collection_id"], name: "index_custom_lists_on_custom_collection_id", using: :btree
  add_index "custom_lists", ["kanji_id", "custom_collection_id"], name: "index_custom_lists_on_kanji_id_and_custom_collection_id", unique: true, using: :btree
  add_index "custom_lists", ["kanji_id"], name: "index_custom_lists_on_kanji_id", using: :btree

  create_table "kanjis", force: true do |t|
    t.string   "kanji"
    t.string   "onyomi"
    t.string   "kunyomi"
    t.string   "english"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lists", force: true do |t|
    t.integer  "kanji_id"
    t.integer  "collection_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "lists", ["collection_id"], name: "index_lists_on_collection_id", using: :btree
  add_index "lists", ["kanji_id", "collection_id"], name: "index_lists_on_kanji_id_and_collection_id", unique: true, using: :btree
  add_index "lists", ["kanji_id"], name: "index_lists_on_kanji_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.string   "permalink"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["created_at"], name: "index_posts_on_created_at", using: :btree
  add_index "posts", ["permalink"], name: "index_posts_on_permalink", using: :btree
  add_index "posts", ["title", "created_at"], name: "index_posts_on_title_and_created_at", using: :btree
  add_index "posts", ["title"], name: "index_posts_on_title", using: :btree
  add_index "posts", ["user_id", "created_at"], name: "index_posts_on_user_id_and_created_at", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "word_collections", force: true do |t|
    t.integer  "collection_id"
    t.integer  "word_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "word_collections", ["collection_id"], name: "index_word_collections_on_collection_id", using: :btree
  add_index "word_collections", ["word_id", "collection_id"], name: "index_word_collections_on_word_id_and_collection_id", unique: true, using: :btree
  add_index "word_collections", ["word_id"], name: "index_word_collections_on_word_id", using: :btree

  create_table "word_kanjis", force: true do |t|
    t.integer  "kanji_id"
    t.integer  "word_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "word_kanjis", ["kanji_id", "word_id"], name: "index_word_kanjis_on_kanji_id_and_word_id", unique: true, using: :btree
  add_index "word_kanjis", ["kanji_id"], name: "index_word_kanjis_on_kanji_id", using: :btree
  add_index "word_kanjis", ["word_id"], name: "index_word_kanjis_on_word_id", using: :btree

  create_table "words", force: true do |t|
    t.text     "word"
    t.text     "reading"
    t.text     "translation"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "words", ["reading"], name: "index_words_on_reading", using: :btree
  add_index "words", ["translation"], name: "index_words_on_translation", using: :btree
  add_index "words", ["word"], name: "index_words_on_word", using: :btree

end
