require 'rails_helper'

describe Trip, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :destination}
    it { should validate_presence_of :miles }
  end

  describe "relationships" do
    it {should have_many :trip_travelers}
    it {should have_many(:travelers).through(:trip_travelers)}
  end

  describe "Instance Methods" do
    it "similar_destinations" do
      @trip1 = Trip.create!(title: "Cheese Tour 2020", destination: "Madison, WI", miles: 1100)
      @trip2 = Trip.create!(title: "Packers Tailgate", destination: "Madison, WI", miles: 1100)
      @trip3 = Trip.create!(title: "Wisconsin World Tour", destination: "Madison, WI", miles: 1100)

      expect(@trip1.similar_destinations).to include(@trip2, @trip3)
    end
  end


end
