class CreateShelves < ActiveRecord::Migration[5.2]
  def change
    create_table :shelves do |t|
      t.string "current_book"
      t.string "read_books"
      t.string "upcoming_books"
      t.belongs_to :club, foreign_key: true
    end
  end
end
