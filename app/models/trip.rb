class Trip < ApplicationRecord
  has_many :road_trip_travelers
  has_many :travelers, through: :road_trip_travelers
end
