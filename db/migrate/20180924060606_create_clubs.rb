class CreateClubs < ActiveRecord::Migration[5.2]
  def change
    create_table :clubs do |t|
      t.string "name"
      t.string "genre"
      t.text "description"
      t.belongs_to :user, foreign_key: true
    end
  end
end
