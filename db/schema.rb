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

ActiveRecord::Schema.define(version: 2018_10_05_101650) do

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.text "description"
    t.string "isbn"
    t.string "image"
    t.integer "shelf_id"
    t.index ["shelf_id"], name: "index_books_on_shelf_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "genre"
    t.text "description"
    t.integer "user_id"
    t.index ["user_id"], name: "index_clubs_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.integer "user_id"
    t.integer "discussion_id"
    t.index ["discussion_id"], name: "index_comments_on_discussion_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "discussions", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "user_id"
    t.integer "book_id"
    t.text "book_quote"
    t.index ["book_id"], name: "index_discussions_on_book_id"
    t.index ["user_id"], name: "index_discussions_on_user_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.boolean "member", default: false
    t.integer "user_id"
    t.integer "club_id"
    t.index ["club_id"], name: "index_memberships_on_club_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "shelves", force: :cascade do |t|
    t.string "current_book"
    t.string "read_books"
    t.string "upcoming_books"
    t.integer "club_id"
    t.index ["club_id"], name: "index_shelves_on_club_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "image"
    t.string "location"
    t.string "twitter"
    t.string "facebook"
    t.string "instagram"
    t.string "first_name"
    t.string "last_name"
    t.text "bio"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["provider"], name: "index_users_on_provider"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid"], name: "index_users_on_uid"
  end

end
