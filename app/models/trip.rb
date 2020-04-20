class Trip < ApplicationRecord
  has_many :traveler_trips
  has_many :travelers, through: :traveler_trips

  def self.order_by_mileage
    order(:mileage)
  end

  def similar_trips
    Trip.where(destination_city: self.destination_city)
  end

  def matching_trips?
    self.similar_trips.length > 1
  end
end 