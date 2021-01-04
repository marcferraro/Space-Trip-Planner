class CreateTravellerTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :traveller_trips do |t|
      t.integer :trip_id
      t.integer :traveller_id

      t.timestamps
    end
  end
end
