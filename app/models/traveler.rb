class Traveler < ApplicationRecord
  has_many :traveler_trips
  has_many :trips, through: :traveler_trips

  def find_traveler_trip(trip_id)
    traveler_trips.where(trip_id: trip_id).first
  end  
end