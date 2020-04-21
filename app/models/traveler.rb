class Traveler <ApplicationRecord
  has_many :traveler_trips
  has_many :trips, through: :traveler_trips

  def trip_avg
    trips.average(:mileage)
  end
end
