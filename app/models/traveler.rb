class Traveler <ApplicationRecord
  has_many :traveler_trips
  has_many :trips, through: :traveler_trips

  def average_mileage
    trips.average(:mileage)
  end
end
