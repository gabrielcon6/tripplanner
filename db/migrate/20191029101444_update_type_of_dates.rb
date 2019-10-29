class UpdateTypeOfDates < ActiveRecord::Migration[6.0]
  def change
    change_column :activities, :start_date, :date
    change_column :activities, :end_date, :date
    change_column :trips, :start_date, :date
    rename_column :trips, :num_of_days, :end_date
  end
end
