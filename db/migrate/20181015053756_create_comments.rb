class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text "body"
      t.belongs_to :discussion, foreign_key: {on_delete: :cascade}
      t.belongs_to :user, foreign_key: {on_delete: :cascade}
    end
  end
end
