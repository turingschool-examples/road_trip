class Trip < ApplicationRecord
  has_many :trips_travelers
  has_many :travelers, through: :trips_travelers

  validates_presence_of :title,
                        :destination,
                        :mileage
end
