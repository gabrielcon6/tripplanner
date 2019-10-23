class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.text :destination
      t.datetime :start_date
      t.integer :num_of_days
      
      t.timestamps
    end
  end
end
