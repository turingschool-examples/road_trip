class Traveler < ApplicationRecord
  has_many :traveler_trips
  has_many :trips, through: :traveler_trips
  validates_presence_of :name, :age
end
