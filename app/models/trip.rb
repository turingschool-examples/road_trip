class Trip < ApplicationRecord
  validates_presence_of :title,
                        :destination_city,
                        :mileage

  has_many :trip_travelers
  has_many :travelers, through: :trip_travelers

  def all_trips_by_mileage
    @trips.order(mileage: :asc)
  end
end
