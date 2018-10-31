class CreateShelves < ActiveRecord::Migration[5.2]
  def change
    create_table :shelves do |t|
      t.string "current_book"
      t.text "read_books"
      t.text "upcoming_books"
      t.belongs_to :club, foreign_key: {on_delete: :cascade}
    end
  end
end
