class Trip < ApplicationRecord
  has_many :traveler_trips
  has_many :travelers, through: :traveler_trips

  def similar_trips
    trips = Trip.where(destination: self.destination)
    trips.where.not(id:self.id)
  end
end
