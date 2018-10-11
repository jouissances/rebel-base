class AddForeignKeyToDiscussions < ActiveRecord::Migration[5.2]
  def change
    change_table :discussions do |t|
      t.belongs_to :club, foreign_key: true
    end
  end
end
