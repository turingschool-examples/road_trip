class Trip < ApplicationRecord

  has_many :traveler_trips
  has_many :travelers, through: :traveler_trips

  def similar_trips
    Trip.where(destination_city: self.destination_city).where.not(id: self.id)
  end

end
