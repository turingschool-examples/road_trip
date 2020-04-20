class Trip < ApplicationRecord
  validates_presence_of :title, :city, :mileage

  has_many :traveler_trips
  has_many :travelers, through: :traveler_trips

  def similar_trips
    Trip.where("city = ? AND id != ?", self.city, self.id)
  end
end
