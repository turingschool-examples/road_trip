class Trip < ApplicationRecord
  has_many :traveler_trips
  has_many :travelers, through: :traveler_trips

  def remove_traveler(traveler_param)
    travelers.delete(traveler_param)
  end
end