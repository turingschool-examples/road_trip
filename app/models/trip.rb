class Trip < ApplicationRecord
  validates_presence_of :title, :city, :milage

  has_many :traveler_trips
  has_many :travelers, through: :traveler_trips
end
