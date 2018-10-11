class TidyUpMigration < ActiveRecord::Migration[5.2]
  def change
    remove_column :clubs, :user_id
    remove_column :discussions, :book_id
  end
end
