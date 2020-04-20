require 'rails_helper'

RSpec.describe TripTraveler, type: :model do

  describe "validations" do
    it { should validate_presence_of :traveler_id }
    it { should validate_presence_of :trip_id }
  end

  describe "relationships" do
    it {should belong_to :trip}
    it {should belong_to :traveler}
  end
end
