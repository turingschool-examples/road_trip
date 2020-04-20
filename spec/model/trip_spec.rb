require "rails_helper"

RSpec.describe Trip, type: :model do

  describe "Validations" do
    it {should validate_presence_of :title}
    it {should validate_presence_of :destination_city}
    it {should validate_presence_of :mileage}
  end

  describe "Relationships" do
    it {should have_many :traveler_trips}
    it {should have_many(:travelers).through(:traveler_trips)}
  end

  describe "Instance Methods" do

  end
  describe "Class Methods" do
    before(:each) do
      @trip1 = Trip.create!(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
      @trip2 = Trip.create!(title: "Who is America Anyway?", destination_city: "Washington, D.C.", mileage: 300)
      @trip3 = Trip.create!(title: "The Big Apple", destination_city: "New York City, NY", mileage: 850)
      @trip4 = Trip.create!(title: "Bike n’ Climb", destination_city: "Moab, UT", mileage: 700)
    end
    it ".sort_by_mileage" do
      expect(Trip.sort_by_mileage(:asc)[0]).to eql(@trip2)
      expect(Trip.sort_by_mileage(:asc)[1]).to eql(@trip4)
      expect(Trip.sort_by_mileage(:asc)[2]).to eql(@trip3)
      expect(Trip.sort_by_mileage(:asc)[3]).to eql(@trip1)
    end
  end
end
