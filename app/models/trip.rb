class Trip < ApplicationRecord
  has_many :traveler_trips
  has_many :travelers, through: :traveler_trips

  def self.trips_by_mileage_ascending
    Trip.all.order("mileage ASC")
  end

  def self.remove_traveler(params)
    trav_trip = TravelerTrip.where("trip_id = ?", params[:id]).where("traveler_id = ?", params[:traveler_id]).first
    TravelerTrip.destroy(trav_trip.id)
  end

  def other_trips(destination, exclude_id)
    Trip.where("destination_city = ?", destination).where("id != ?", exclude_id)
  end
end
