class Traveler < ApplicationRecord
  has_many :trips_travelers
  has_many :trips, through: :trips_travelers

  validates_presence_of :name,
                        :age
end
