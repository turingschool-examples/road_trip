class Trip < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :destination_city
  validates_presence_of :mileage

  has_many :traveler_trips
  has_many :travelers, through: :traveler_trips
end
