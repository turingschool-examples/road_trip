class Trip < ApplicationRecord
  has_many :trips_travelers
  has_many :travelers, through: :trips_travelers

  validates_presence_of :title,
                        :destination,
                        :mileage

  def self.order_by_mileage_asc
    Trip.order(mileage: :asc)
  end

  def similar_trips
    Trip.where(destination: destination).where.not(id: id)
  end
end
