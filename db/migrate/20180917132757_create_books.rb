class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.boolean :series
      t.text :excerpt
      t.string :isbn
      t.integer :club_id

      t.timestamps
    end
  end
end
