class Trip < ApplicationRecord 
  validates_presence_of :title, :city, :mileage 

  def self.by_mileage
    all.order(mileage: :asc)
  end
end