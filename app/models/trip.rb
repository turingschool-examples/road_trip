class Trip < ApplicationRecord
  has_many :traveler_trips
  has_many :travelers, through: :traveler_trips

  def self.sort_by_mileage
    order(:mileage)    
  end
end