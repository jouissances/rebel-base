class RemoveReferenceFromReadings < ActiveRecord::Migration[5.2]
  def change
    add_reference :discussions, :book, foreign_key: {on_delete: :cascade}
  end
end
