class Traveler < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :age

  has_many :traveler_trips
  has_many :trips, through: :traveler_trips
end
