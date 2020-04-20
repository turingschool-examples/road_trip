class Trip < ApplicationRecord
  has_many :trip_travelers
  has_many :travelers, through: :trip_travelers


  def similar_trips
    Trip.where(destination: self.destination).where.not(id: self.id)
  end
end