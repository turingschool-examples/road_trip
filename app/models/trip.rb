class Trip < ApplicationRecord
  validates_presence_of :title,
                        :destination_city,
                        :mileage

  has_many :travelers
end
