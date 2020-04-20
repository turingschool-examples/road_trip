class Trip < ApplicationRecord
  has_many :trip_travelers
  has_many :travelers, through: :trip_travelers
  def self.ordered
    Trip.order(:mileage)
  end
end
