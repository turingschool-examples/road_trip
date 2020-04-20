class Trip < ApplicationRecord
  validates_presence_of :title,
                        :destination_city,
                        :mileage

  has_many :trip_travelers
  has_many :travelers, through: :trip_travelers

  #class methods
  def self.mileage_sort
    order(mileage: :asc)
  end

  #instance_methods
    #need to make solid test without factory bot
  def similar_trips
   Trip.where(destination_city: destination_city).where.not(id: id)
  end

end
