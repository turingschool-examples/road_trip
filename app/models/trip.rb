class Trip < ApplicationRecord
  has_many :traveler_trips
  has_many :travelers, through: :traveler_trips

  validates_presence_of :title,
                        :destination,
                        :mileage
end
