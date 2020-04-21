class Traveler <ApplicationRecord
  has_many :traveler_trips
  has_many :trips, through: :traveler_trips

  def average_trip_mileage
    self.trips.average(:mileage).to_i
  end
end
