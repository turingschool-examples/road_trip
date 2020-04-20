class Trip < ApplicationRecord

  has_many :trip_travelers
  has_many :travelers, through: :trip_travelers

  def self.ordered
    Trip.order(:mileage)
  end

  def travelers_on_trip
    travelers.pluck(:name)
  end

  def similar_trips
    Trip.where(destination_city: destination_city)
        .where.not(id: id)
  end
end
