class AddLargeCoverToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :image_large, :string, unique: true
  end
end
