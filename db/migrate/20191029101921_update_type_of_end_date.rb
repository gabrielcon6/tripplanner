class UpdateTypeOfEndDate < ActiveRecord::Migration[6.0]
  def change
    remove_column :trips, :end_date
    add_column :trips, :end_date, :date
  end
end
