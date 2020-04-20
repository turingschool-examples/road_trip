class CreateTravelerTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :traveler_trips do |t|
      t.references :traveler, foreign_key: true
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
