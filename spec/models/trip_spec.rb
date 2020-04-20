require "rails_helper"

RSpec.describe Trip, type: :model do

  describe 'Relationships' do
    it {should have_many :trip_travelers}
    it {should have_many(:travelers).through(:trip_travelers)}
  end

  describe "Validations" do
    it {should validate_presence_of :title}
    it {should validate_presence_of :destination_city}
    it {should validate_presence_of :mileage}
  end

  describe "Instance Methods" do
    before :each do
      @trip_1 = Trip.create!(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
      @trip_2 = Trip.create!(title: "That 70's Tour", destination_city: "Madison, WI", mileage: 300)
      @trip_3 = Trip.create!(title: "Great Lakes Vista", destination_city: "Madison, WI", mileage: 800)
      @trip_4 = Trip.create!(title: "Frigid Heights", destination_city: "Madison, WI", mileage: 750)

      @trip_5 = Trip.create!(title: "Who is America Anyway?", destination_city: "Washington, D.C.", mileage: 300)
      @trip_6 = Trip.create!(title: "The Big Apple", destination_city: "New York City, NY", mileage: 850)
      @trip_7 = Trip.create!(title: "Bike n’ Climb", destination_city: "Moab, UT", mileage: 700)
    end

    it ".similar_trips" do
      similar_trips = [@trip_2, @trip_3, @trip_4]

      expect(@trip_1.similar_trips).to eq(similar_trips)
    end
  end

end
