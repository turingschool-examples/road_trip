class Traveler <ApplicationRecord
  has_many :trip_travelers
  has_many :trips, through: :trip_travelers

  def trips_ordered
    trips.order(:milage)
  end

end