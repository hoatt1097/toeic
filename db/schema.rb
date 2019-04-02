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

ActiveRecord::Schema.define(version: 20190309164141) do

  create_table "operator_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "nickname",        null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "user_exercises", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "user_lessons_id"
    t.string   "question",        null: false
    t.string   "answer",          null: false
    t.string   "answer_wrong"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["user_lessons_id"], name: "index_user_exercises_on_user_lessons_id", using: :btree
  end

  create_table "user_grammars", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "user_lessons_id"
    t.text     "content",         limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["user_lessons_id"], name: "index_user_grammars_on_user_lessons_id", using: :btree
  end

  create_table "user_lessons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "user_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "nickname",        null: false
    t.string   "name",            null: false
    t.string   "password_digest", null: false
    t.string   "email",           null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "user_vocabularies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "user_lessons_id"
    t.string   "word",            null: false
    t.string   "mean",            null: false
    t.string   "word_type"
    t.string   "synonym"
    t.string   "antonyms"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["user_lessons_id"], name: "index_user_vocabularies_on_user_lessons_id", using: :btree
  end

  add_foreign_key "user_exercises", "user_lessons", column: "user_lessons_id"
  add_foreign_key "user_grammars", "user_lessons", column: "user_lessons_id"
  add_foreign_key "user_vocabularies", "user_lessons", column: "user_lessons_id"
end
