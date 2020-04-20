class Traveler < ApplicationRecord

  validates_presence_of :name, :age

  has_many :trip_travelers, dependent: :destroy
  has_many :trips, through: :trip_travelers

end
