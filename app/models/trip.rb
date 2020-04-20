class Trip < ApplicationRecord
  def self.ordered
    Trip.order(:mileage)
  end
end
