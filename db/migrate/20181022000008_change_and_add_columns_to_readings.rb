class ChangeAndAddColumnsToReadings < ActiveRecord::Migration[5.2]
  def change
    rename_column :readings, :date_time, :start_date
    add_column :readings, :end_date, :datetime
    add_foreign_key :readings, :user
  end
end
