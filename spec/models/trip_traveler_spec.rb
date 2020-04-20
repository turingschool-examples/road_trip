require 'rails_helper'

RSpec.describe TripTraveler do
  describe 'Relationships' do
    it {should belong_to :trip}
    it {should belong_to :traveler}
  end

end
