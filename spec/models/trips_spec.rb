require 'rails_helper'

RSpec.describe Trip do
  describe "relationships" do
    it { should have_many(:traveler_trips) }
    it { should have_many(:travelers).through(:traveler_trips) } 
  end

  describe "class methods" do
    before(:each) do
      @trip1 = Trip.create(name: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
      @trip2 = Trip.create!(name: "Who is America Anyway?", destination_city: "Washington, D.C.", mileage: 300)
      @trip3 = Trip.create!(name: "The Big Apple", destination_city: "New York City, NY", mileage: 850)
      @trip4 = Trip.create!(name: "Bike n’ Climb", destination_city: "Moab, UT", mileage: 700)
    end

    it "order_by_mileage" do
      expectation = [@trip2, @trip4, @trip3, @trip1]
      expect(Trip.order_by_mileage).to eq(expectation)
    end
  end

  describe "instance methods" do
    before(:each) do
      @trip1 = Trip.create(name: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
      @trip2 = Trip.create!(name: "Who is America Anyway?", destination_city: "Washington, D.C.", mileage: 300)
      @trip3 = Trip.create!(name: "The Big Apple", destination_city: "New York City, NY", mileage: 850)
      @trip4 = Trip.create!(name: "Bike n’ Climb", destination_city: "Moab, UT", mileage: 700)
      @trip5 = Trip.create(name: "Midwest College Tour", destination_city: "Madison, WI", mileage: 1100)
      @trip6 = Trip.create(name: "Badger Game Weekend", destination_city: "Madison, WI", mileage: 300)
      @trip7 = Trip.create(name: "Bar Crawl", destination_city: "Madison, WI", mileage: 1)
    end

    it "similar_trips" do
      expect(@trip1.similar_trips).to eq([@trip1, @trip5, @trip6, @trip7])
    end

    it "matching_trips?" do
      expect(@trip1.matching_trips?).to eq(true)
      expect(@trip2.matching_trips?).to eq(false)
    end
  end
end