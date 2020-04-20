class Trip < ApplicationRecord

  validates_presence_of :title, :destination_city, :mileage

  has_many :trip_travelers, dependent: :destroy
  has_many :travelers, through: :trip_travelers

  def similar_trips
    trip = Trip.find(id)
    same_city_trips = Trip.where(destination_city: "#{trip.destination_city}").distinct    
  end
end
