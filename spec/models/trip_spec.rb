require 'rails_helper'

describe Trip, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :destination }
    it { should validate_presence_of :mileage }
  end

  describe "relationships" do
    it {should have_many :traveler_trips}
    it {should have_many(:travelers).through(:traveler_trips)}
  end

  describe "class methods" do
    before(:each) do
      @trip_1 = Trip.create(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
      @trip_2 = Trip.create(title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
      @trip_3 = Trip.create(title: "The Big Apple", destination: "New York City, NY", mileage: 850)
      @trip_4 = Trip.create(title: "Bike n’ Climb", destination: "Moab, UT", mileage: 700)
    end

    it '.sorted_by_mileage' do
      expect(Trip.sorted_by_mileage).to eq([@trip_2, @trip_4, @trip_3, @trip_1])
    end
  end

  describe 'instance methods' do

    before(:each) do
    @trip_1 = Trip.create(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
    @trip_2 = Trip.create(title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
    @trip_3 = Trip.create(title: "The Big Apple", destination: "New York City, NY", mileage: 850)
    @trip_4 = Trip.create(title: "Bike n’ Climb", destination: "Moab, UT", mileage: 700)
    @trip_5 = Trip.create(title: "Broadway Hits", destination: "New York City, NY", mileage: 780)
    @trip_6 = Trip.create(title: "Colonial History of NYC", destination: "New York City, NY", mileage: 1050)

    @traveler_1 = Traveler.create(name: "Tommy Tom", age: 46)
    @traveler_2 = Traveler.create(name: "Cory Cory", age: 19)
    @traveler_3 = Traveler.create(name: "Mary Mae", age: 44)
    @traveler_4 = Traveler.create(name: "Smith John", age: 9)

    TravelerTrip.create!(trip: @trip_1, traveler: @traveler_1)
    TravelerTrip.create!(trip: @trip_1, traveler: @traveler_4)
  end

    it 'remove_traveler' do
      expect(@trip_1.travelers).to eq([@traveler_1, @traveler_4])
      @trip_1.remove_traveler(@traveler_4)
      @trip_1.reload
      expect(@trip_1.travelers).to eq([@traveler_1])
    end

    it 'same_trip_destinations' do
      expect(@trip_3.same_trip_destinations).to eq([@trip_5, @trip_6])
    end
    
  end
end
