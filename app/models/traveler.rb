class Traveler < ApplicationRecord
  validates :name, :age, presence: true
  has_many :traveler_trips
  has_many :trips, through: :traveler_trips
end