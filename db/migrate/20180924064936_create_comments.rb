class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text "body"
      t.belongs_to :user, foreign_key: true
      t.belongs_to :discussion, foreign_key: true
    end
  end
end
