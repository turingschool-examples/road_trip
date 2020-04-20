require "rails_helper"

RSpec.describe TravelerTrip, type: :model do

  describe "Validations" do

  end

  describe "Relationships" do
    it {should belong_to :traveler}
    it {should belong_to :trip}
  end

  describe "Instance Methods" do

  end

end
