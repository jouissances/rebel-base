class ChangeUsersTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :username, :string
    # remove_column :users, :first_name, :string
    # remove_column :users, :last_name, :string
    # add_column :users, :name, :string
    # add_column :users, :current_read, :string
  end
end
