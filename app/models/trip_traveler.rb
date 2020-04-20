class TripTraveler < ApplicationRecord
  validates_presence_of :trip_id,
                        :traveler_id

  belongs_to :traveler
  belongs_to :trip
end
