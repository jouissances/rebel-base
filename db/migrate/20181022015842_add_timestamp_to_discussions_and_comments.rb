class AddTimestampToDiscussionsAndComments < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :discussions, null: true 
    add_timestamps :comments, null: true 
  end
end
