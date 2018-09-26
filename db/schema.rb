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

ActiveRecord::Schema.define(version: 2018_09_25_070526) do

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
    t.string "gender"
    t.string "image"
    t.string "uid"
    t.string "location"
    t.string "email"
    t.string "password_digest"
    t.text "bio"
    t.string "twitter"
    t.string "facebook"
    t.string "instagram"
    t.string "last_name"
    t.string "first_name"
  end

end
