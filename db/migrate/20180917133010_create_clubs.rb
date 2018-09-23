class CreateClubs < ActiveRecord::Migration[5.2]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :genre
      t.integer :user_id
      t.integer :book_id
      t.integer :member_count
      t.string :current_selection
      t.string :read_books
      t.string :upcoming_books

      t.timestamps
    end
  end
end
