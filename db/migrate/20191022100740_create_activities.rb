class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :title
      t.string :time
      t.text :description
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
      t.integer :trip_id
    end
  end
end
