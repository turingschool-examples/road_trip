class Traveler < ApplicationRecord
  has_many :road_trip_travelers
  has_many :trips, through: :road_trip_travelers
end
