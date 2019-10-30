class RemoveTripIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :trip_id, :integer
  end
end
