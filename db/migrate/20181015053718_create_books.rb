class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string "title"
      t.string "author"
      t.text "description"
      t.string "isbn"
      t.string "image"
      t.belongs_to :shelf, foreign_key: {on_delete: :cascade}
    end
  end
end
