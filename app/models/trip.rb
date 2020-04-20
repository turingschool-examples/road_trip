class Trip < ApplicationRecord
  has_many :trip_travelers
  has_many :travelers, through: :trip_travelers

  def self.by_mileage
    Trip.order(:mileage)
  end

  def similar_trips
    similar = Trip.where(destination_city: self.destination_city)
    similar.where.not(title: self.title)
  end
end
