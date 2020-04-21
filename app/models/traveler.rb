class Traveler <ApplicationRecord
  has_many :traveler_trips
  has_many :trips, through: :traveler_trips

  def average_miles
    Trip.average(:mileage)
  end
  
end
