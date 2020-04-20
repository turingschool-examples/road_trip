require 'rails_helper'

RSpec.describe "As a visitor" do
  before(:each) do
    @trip1 = Trip.create(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
    @trip2 = Trip.create(title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
    @trip3 = Trip.create(title: "The Big Apple", destination: "New York City, NY", mileage: 850)
    @trip4 = Trip.create(title: "Bike n’ Climb", destination: "Moab, UT", mileage: 700)
    @traveler1 = Traveler.create(name: "Sally Sue", age: 25)
    @traveler2 = Traveler.create(name: "Tommy Tom", age: 46)
    @traveler3 = Traveler.create(name: "Cory Cory", age: 19)
    @traveler4 = Traveler.create(name: "Mary Mae", age: 44)
    @traveler5 = Traveler.create(name: "Smith John", age: 9)
  end
  it "I can see the titles of all trips in ascending mileage" do
    visit "/trips"
    save_and_open_page
    within('#trips') do
      expect(page.all('li')[0]).to have_content(@trip2.title)
      expect(page.all('li')[1]).to have_content(@trip4.title)
      expect(page.all('li')[2]).to have_content(@trip3.title)
      expect(page.all('li')[3]).to have_content(@trip1.title)
    end
  end
end