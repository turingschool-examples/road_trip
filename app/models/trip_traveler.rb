class TripTraveler < ApplicationRecord
  validates_presence_of :trip_id, :traveler_id

  belongs_to :trip
  belongs_to :traveler
end