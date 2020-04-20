class Trip < ApplicationRecord

  def self.sorted_by_mileage
    Trip.all.order(:mileage)
  end
end
