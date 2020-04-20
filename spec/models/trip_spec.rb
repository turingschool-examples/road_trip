require 'rails_helper'

RSpec.describe Trip do
  describe "validations" do
    it {should validate_presence_of :title}
    it {should validate_presence_of :destination}
    it {should validate_presence_of :mileage}
  end

  describe "relationships" do
    it {should have_many :traveler_trips}
    it {should have_many(:travelers).through(:traveler_trips)}
  end

  describe "instance methods" do
    before(:each) do
      @trip1 = Trip.create(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
      @trip2 = Trip.create(title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
      @trip3 = Trip.create(title: "The Big Cheese", destination: "Madison, WI", mileage: 850)
      @trip4 = Trip.create(title: "Cheese n’ Climb", destination: "Madison, WI", mileage: 700)
      @traveler1 = @trip1.travelers.create(name: "Sally Sue", age: 25)
    end

    it "remove_traveler" do
      expect(@trip1.travelers).to include(@traveler1)

      @trip1.remove_traveler(@traveler1)

      expect(@trip1.travelers).to_not include(@traveler1)
    end

    it "similar_trips" do
      expect(@trip1.similar_trips).to_not include(@trip1)
      expect(@trip1.similar_trips).to_not include(@trip2)
      expect(@trip1.similar_trips).to include(@trip3)
      expect(@trip1.similar_trips).to include(@trip4)
    end
  end
end