class DeleteReadingIndex < ActiveRecord::Migration[5.2]
  def change
    remove_reference :discussions, :reading, foreign_key: true
  end
end
