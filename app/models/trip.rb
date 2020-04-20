class Trip < ApplicationRecord
  has_many :trip_travelers
  has_many :travelers, through: :trip_travelers

  def self.by_mileage
    Trip.order(:mileage)
  end

  def similar_trips
    Trip.where(destination_city: self.destination_city)
  end
end
