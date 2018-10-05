class AddUserColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gender, :string
    add_column :users, :image, :string
    add_column :users, :location, :string
    add_column :users, :twitter, :string
    add_column :users, :facebook, :string
    add_column :users, :instagram, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :bio, :text
  end
end
