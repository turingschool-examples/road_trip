class Traveler <ApplicationRecord
  has_many :traveler_trips
  has_many :trips, through: :traveler_trips

  def avg_mileage
    self.trips.average(:mileage)
  end
end
