class AddUserIdToReadings < ActiveRecord::Migration[5.2]
  def change
    add_reference :readings, :user, foreign_key: true
  end
end
