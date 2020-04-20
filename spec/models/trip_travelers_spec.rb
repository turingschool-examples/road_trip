require "rails_helper"

RSpec.describe TripTraveler, type: :model do
  describe 'releationships' do
    it {should belong_to :trip}
    it {should belong_to :traveler}
  end
end