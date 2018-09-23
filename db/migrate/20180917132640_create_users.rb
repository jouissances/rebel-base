class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :location
      t.string :email
      t.string :password_digest
      t.text :bio
      t.text :reason
      t.string :twitter
      t.string :facebook
      t.string :instagram
      t.string :current_read
      t.integer :book_id
      t.integer :club_id
      t.integer :book_count

      t.timestamps
    end
  end
end
