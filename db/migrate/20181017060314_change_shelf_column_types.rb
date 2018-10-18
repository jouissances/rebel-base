class ChangeShelfColumnTypes < ActiveRecord::Migration[5.2]
  def change
    change_column :shelves, :read_books, :text
    change_column :shelves, :upcoming_books, :text
  end
end
