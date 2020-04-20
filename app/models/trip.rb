class Trip < ApplicationRecord
  has_many :trip_travelers
  has_many :travelers, through: :trip_travelers

  def self.mileage_asc
    order("mileage asc")
  end
end
