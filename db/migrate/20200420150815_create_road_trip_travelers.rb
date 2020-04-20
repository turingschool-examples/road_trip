class CreateRoadTripTravelers < ActiveRecord::Migration[5.1]
  def change
    create_table :road_trip_travelers do |t|
      t.references :road_trip, foreign_key: true
      t.references :traveler, foreign_key: true
    end
  end
end
