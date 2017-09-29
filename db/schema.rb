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

ActiveRecord::Schema.define(version: 20170929191729) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text "body", null: false
    t.boolean "validated", default: false
    t.text "code"
    t.integer "votes_num", default: 0
    t.integer "views", default: 0
    t.bigint "question_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title", null: false
    t.text "body", null: false
    t.integer "votes_num", default: 0
    t.integer "views", default: 0
    t.integer "answers_num", default: 0
    t.text "tags"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest", null: false
    t.string "avatar"
    t.text "bio_text"
    t.integer "questions_asked_num", default: 0
    t.integer "questions_answered_num", default: 0
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_big"
    t.index ["token"], name: "index_users_on_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.integer "value"
    t.bigint "user_id"
    t.bigint "question_id"
    t.bigint "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id", "user_id"], name: "index_votes_on_answer_id_and_user_id", unique: true
    t.index ["answer_id"], name: "index_votes_on_answer_id"
    t.index ["question_id", "user_id"], name: "index_votes_on_question_id_and_user_id", unique: true
    t.index ["question_id"], name: "index_votes_on_question_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "questions", "users"
  add_foreign_key "votes", "answers"
  add_foreign_key "votes", "questions"
  add_foreign_key "votes", "users"
end
