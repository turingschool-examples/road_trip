class Trip < ApplicationRecord
  validates_presence_of :title,
                        :destination_city,
                        :mileage

  has_many :trip_travelers
  has_many :travelers, through: :trip_travelers

  def self.mileage_sort
    order(mileage: :asc)
  end
end
