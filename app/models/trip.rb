class Trip < ApplicationRecord

  validates_presence_of :title, :destination, :miles
  has_many :trip_travelers
  has_many :travelers, through: :trip_travelers

    def similar_destinations
      similar_trips = Trip.where(destination: self.destination)
      similar_trips.where.not(id: self.id)
    end
end
