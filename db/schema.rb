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

ActiveRecord::Schema.define(version: 2018_10_26_072205) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.text "description"
    t.string "isbn"
    t.string "image"
    t.bigint "shelf_id"
    t.string "slug"
    t.string "link"
    t.string "image_large"
    t.index ["shelf_id"], name: "index_books_on_shelf_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "genre"
    t.text "description"
    t.integer "followers_count", default: 0
    t.string "subgenre"
    t.string "club_image"
    t.string "cover_image"
    t.string "slug"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.bigint "discussion_id"
    t.bigint "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["discussion_id"], name: "index_comments_on_discussion_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "discussions", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.text "book_quote"
    t.bigint "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "book_id"
    t.index ["book_id"], name: "index_discussions_on_book_id"
    t.index ["user_id"], name: "index_discussions_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.string "follower_type"
    t.integer "follower_id"
    t.string "followable_type"
    t.integer "followable_id"
    t.datetime "created_at"
    t.index ["followable_id", "followable_type"], name: "fk_followables"
    t.index ["follower_id", "follower_type"], name: "fk_follows"
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "likes", force: :cascade do |t|
    t.string "liker_type"
    t.integer "liker_id"
    t.string "likeable_type"
    t.integer "likeable_id"
    t.datetime "created_at"
    t.index ["likeable_id", "likeable_type"], name: "fk_likeables"
    t.index ["liker_id", "liker_type"], name: "fk_likes"
  end

  create_table "memberships", force: :cascade do |t|
    t.boolean "admin", default: false
    t.bigint "user_id"
    t.bigint "club_id"
    t.index ["club_id"], name: "index_memberships_on_club_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "mentions", force: :cascade do |t|
    t.string "mentioner_type"
    t.integer "mentioner_id"
    t.string "mentionable_type"
    t.integer "mentionable_id"
    t.datetime "created_at"
    t.index ["mentionable_id", "mentionable_type"], name: "fk_mentionables"
    t.index ["mentioner_id", "mentioner_type"], name: "fk_mentions"
  end

  create_table "shelves", force: :cascade do |t|
    t.string "current_book"
    t.text "read_books"
    t.text "upcoming_books"
    t.bigint "club_id"
    t.index ["club_id"], name: "index_shelves_on_club_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "image"
    t.string "uid"
    t.string "location"
    t.string "provider"
    t.string "password_digest"
    t.text "bio"
    t.string "twitter"
    t.string "facebook"
    t.string "instagram"
    t.string "slack"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "slug"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "books", "shelves", on_delete: :cascade
  add_foreign_key "comments", "discussions", on_delete: :cascade
  add_foreign_key "comments", "users", on_delete: :cascade
  add_foreign_key "discussions", "books", on_delete: :cascade
  add_foreign_key "discussions", "users", on_delete: :cascade
  add_foreign_key "memberships", "clubs", on_delete: :cascade
  add_foreign_key "memberships", "users", on_delete: :cascade
  add_foreign_key "shelves", "clubs", on_delete: :cascade
end
