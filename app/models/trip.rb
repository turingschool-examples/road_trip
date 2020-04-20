class Trip < ApplicationRecord

  validates_presence_of :title, :destination, :miles
  has_many :trip_travelers
  has_many :travelers, through: :trip_travelers

    def similar_destinations
      Trip.where(destination: self.destination)
    end
end
