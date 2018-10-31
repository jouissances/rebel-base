class AddSlugToClubs < ActiveRecord::Migration[5.2]
  def change
    add_column :clubs, :slug, :string, unique: true
  end
end
