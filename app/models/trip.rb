class Trip < ApplicationRecord
  has_many :trip_travelers
  has_many :travelers, through: :trip_travelers

  validates_presence_of :title,
                        :destination_city,
                        :mileage
end
