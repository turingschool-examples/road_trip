class Trip < ApplicationRecord
  has_many :traveler_trips
  has_many :travelers, through: :traveler_trips

  validates_presence_of :title, :destination_city, :mileage

  def self.trip_order
    order(:mileage)
  end
end