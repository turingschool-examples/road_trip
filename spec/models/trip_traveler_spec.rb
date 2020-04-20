require 'rails_helper'

describe TripTraveler, type: :model do
  describe "relationships" do
    it {should belong_to :trip}
    it {should belong_to :traveler}
  end
end
