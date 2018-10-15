class CreateDiscussions < ActiveRecord::Migration[5.2]
  def change
    create_table :discussions do |t|
      t.string "title"
      t.text "body"
      t.text "book_quote"
      t.belongs_to :user, foreign_key: true
      t.belongs_to :reading, foreign_key: true
    end
  end
end
