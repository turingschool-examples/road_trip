class CreateRoadTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :road_trips do |t|
      t.string :title
      t.string :destination
      t.integer :mileage

      t.timestamps
    end
  end
end
