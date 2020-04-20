class Trip < ApplicationRecord 
  validates_presence_of :title, :city, :mileage 
  
end