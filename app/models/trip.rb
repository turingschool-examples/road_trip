class Trip < ApplicationRecord
  has_many :traveler_trips
  has_many :travelers, through: :traveler_trips

  def self.sorted_by_mileage
    Trip.all.order(:mileage)
  end
end
