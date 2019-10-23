class AddUserIdToTrips < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :user_id, :integer
  end
end
