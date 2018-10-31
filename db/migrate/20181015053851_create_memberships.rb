class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      t.boolean "admin", default: false
      t.belongs_to :user, foreign_key: {on_delete: :cascade}
      t.belongs_to :club, foreign_key: {on_delete: :cascade}
    end
  end
end
