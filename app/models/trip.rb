class Trip < ApplicationRecord
  has_many :traveler_trips
  has_many :travelers, through: :traveler_trips

  def self.trips_by_mileage_ascending
    Trip.all.order("mileage ASC")
  end
end
