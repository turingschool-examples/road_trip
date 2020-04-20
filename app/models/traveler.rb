class Traveler < ApplicationRecord
  validates_presence_of :name, :age

  has_many :trips
end
