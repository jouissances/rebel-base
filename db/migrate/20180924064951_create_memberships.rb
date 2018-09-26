class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      t.boolean "member", default: false
      t.belongs_to :user, foreign_key: true
      t.belongs_to :club, foreign_key: true
    end
  end
end
