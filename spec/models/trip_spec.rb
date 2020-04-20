require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe "relationships" do
    it { should have_many(:travelers).through(:traveler_trips)}
  end

  before(:each) do
    @traveler_1 = Traveler.create(name: 'Sally Sue', age: 25)
    @trip_1 = @traveler_1.trips.create(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 900)
    @trip_2 = @traveler_1.trips.create(title: "Walk America", destination: "Santa Fe, NM", mileage: 5100)
    @trip_3 = @traveler_1.trips.create(title: "National Bar Crawl", destination: "Madison, WI", mileage: 1100)
    @trip_4 = @traveler_1.trips.create(title: "Scooter Tour", destination: "Green Bay, WI", mileage: 40)

    @traveler_2 = @trip_1.travelers.create(name: 'Dapper Dan', age: 22)
    @traveler_3 = @trip_1.travelers.create(name: 'Timmy Tom', age: 29)
  end

  describe 'Instance Methods' do
    expect(@trip_1.similar_trips).to eql(@trip_3)
  end
end
