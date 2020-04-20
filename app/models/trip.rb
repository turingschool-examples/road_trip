class Trip < ApplicationRecord

  validates_presence_of :title, :destination_city, :mileage

  has_many :trip_travelers, dependent: :destroy
  has_many :travelers, through: :trip_travelers

  def similar_trips
    require "pry"; binding.pry
    @similar_trips = Trip.find_by(destination_city: "#{@trip.destination_city}")
  end
end
