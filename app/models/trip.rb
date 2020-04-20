class Trip < ApplicationRecord
  has_many :traveler_trips
  has_many :travelers, through: :traveler_trips

  def self.sort_by_mileage
    order(:mileage)    
  end

  def same_destination_trips(destination)
    Trip.where(destination: destination)
  end
end