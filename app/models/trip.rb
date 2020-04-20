class Trip < ApplicationRecord
  has_many :trip_travelers
  has_many :travelers, through: :trip_travelers

  validates_presence_of :title,
                        :destination_city,
                        :mileage

  def self.sorted_trips
    Trip.order(:mileage)
  end

  def similar_trips
    Trip
      .where(destination_city: destination_city)
      .where.not(id: id)
  end
end
