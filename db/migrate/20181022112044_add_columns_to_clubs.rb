class AddColumnsToClubs < ActiveRecord::Migration[5.2]
  def change
    add_column :clubs, :subgenre, :string
    add_column :clubs, :club_image, :string
    add_column :clubs, :cover_image, :string
  end
end
