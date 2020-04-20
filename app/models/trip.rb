class Trip < ApplicationRecord 
  validates_presence_of :title, :city, :mileage 
  has_many :traveler_trips 
  has_many :travelers, through: :traveler_trips
  
  def self.by_mileage
    all.order(mileage: :asc)
  end

  def delete_traveler
    binding.pry
  end
end