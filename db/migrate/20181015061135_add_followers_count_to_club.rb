class AddFollowersCountToClub < ActiveRecord::Migration[5.2]
  def change
    add_column :clubs, :followers_count, :integer, :default => 0
  end
end
