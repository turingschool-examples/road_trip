class Trip < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :destination_city
  validates_presence_of :mileage

  has_many :traveler_trips
  has_many :travelers, through: :traveler_trips

  def self.sort_by_mileage(asc_desc_sym)
    order(mileage: asc_desc_sym)
  end

  def trips_with_same_destination
    Trip.where(destination_city: self.destination_city).where.not(id: self.id)
  end
end
