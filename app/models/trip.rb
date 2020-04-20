class Trip < ApplicationRecord
  has_many :traveler_trips
  has_many :travelers, through: :traveler_trips

  validates_presence_of :title,
                        :destination,
                        :mileage

  def self.sorted_by_mileage
    order('mileage')
  end

  def remove_traveler(traveler)
    traveler_trip = traveler_trips.find_by(traveler_id: traveler.id)
    traveler_trip.destroy
  end
end
