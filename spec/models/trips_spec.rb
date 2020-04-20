require "rails_helper"

RSpec.describe Trip, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :destination_city }
    it { should validate_presence_of :mileage }
  end

  describe "relationships" do
    it { should have_many :traveler_trips }
    it { should have_many(:travelers).through(:traveler_trips) }
  end

  context "methods" do
    before :each do
      @trip1 = Trip.create(title: "Cheese Tour 2020",
                        destination_city: "Madison, WI",
                        mileage: 1100)

      @trip2 = Trip.create(title: "Who is America Anyway?",
                        destination_city: "Washington, D.C.",
                        mileage: 300)

      @trip3 = Trip.create(title: "The Big Apple",
                        destination_city: "New York City, NY",
                        mileage: 850)

      @trip4 = Trip.create(title: "Bike n’ Climb",
                        destination_city: "Moab, UT",
                        mileage: 700)
    end

    describe "class methods" do
      it ".all_by_mileage" do
        expect(Trip.all_by_mileage).to match_array([@trip2, @trip4, @trip3, @trip1])
      end
    end
  end
end
