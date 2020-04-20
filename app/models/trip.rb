class Trip < ApplicationRecord

  validates_presence_of :title, :destination_city, :mileage                       

end
