class Trip < ApplicationRecord
  validates_presence_of :title, :destination_city, :mileage

  has_many :traveler_trips
  has_many :travelers, through: :traveler_trips

  def self.all_by_mileage
    order(:mileage)
  end
end
