class RemoveReferenceFromReadings < ActiveRecord::Migration[5.2]
  def change
    remove_reference :readings, :user, foreign_key: true
    add_reference :discussions, :book, foreign_key: true
  end
end
