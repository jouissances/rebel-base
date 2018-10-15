class CreateReadings < ActiveRecord::Migration[5.2]
  def change
    create_table :readings do |t|
      t.datetime "date_time"
      t.belongs_to :book, foreign_key: true
      t.belongs_to :club, foreign_key: true
      t.timestamps
    end
  end
end
