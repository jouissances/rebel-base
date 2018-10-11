class RetryDeleteForeignKeys < ActiveRecord::Migration[5.2]
  def change
    remove_index :clubs, :user_id

    remove_index :discussions, :book_id

    add_index :discussions, :club_id
  end
end
