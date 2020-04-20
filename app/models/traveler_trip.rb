class TravelerTrip < ApplicationRecord
  belongs_to :trip
  belongs_to :traveler
  validates_presence_of :trip_id, :traveler_id
end
