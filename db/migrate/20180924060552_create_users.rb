class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string "username"
      t.string "first_name"
      t.string "last_name"
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
    end
  end
end
