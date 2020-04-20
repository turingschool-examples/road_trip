require 'rails_helper'

describe TravelerTrip, type: :model do
  describe "validations" do
    it { should validate_presence_of :traveler_id }
    it { should validate_presence_of :trip_id }
  end

  describe "relationships" do
    it {should belong_to :traveler}
    it {should belong_to :trip}
  end

end
