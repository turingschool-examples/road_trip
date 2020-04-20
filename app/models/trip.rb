class Trip < ApplicationRecord
  validates :title, :destination, :mileage, presence: true
  has_many :traveler_trips
  has_many :travelers, through: :traveler_trips

  def remove_traveler(traveler_param)
    travelers.delete(traveler_param)
  end

  def similar_trips
    Trip.where(destination: destination).where.not(id: id)
  end
end