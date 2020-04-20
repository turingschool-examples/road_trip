class TravelerTrip < ApplicationRecord 
  belongs_to :traveler
  belongs_to :trip

  def delete_traveler
    binding.pry
    # where('traveler_id = traveler.id').destroy
  end
end