class Trip < ApplicationRecord
  has_many :traveler_trips
  has_many :travelers, through: :traveler_trips

  def other_trips
    Trip.where(destination: self.destination).where.not(id: id)
  end

end
