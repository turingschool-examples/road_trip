class AddTravelersToTrips < ActiveRecord::Migration[5.1]
  def change
    add_reference :trips, :travelers, foreign_key: true
  end
end
