class Trip < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :destination_city
  validates_presence_of :mileage
end
