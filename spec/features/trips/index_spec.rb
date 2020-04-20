require 'rails_helper'

RSpec.describe "as a visitor" do
  describe "When I visit the trips index page" do
    before(:each) do

      @trip_1 = Trip.create(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
      @trip_2 = Trip.create(title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
      @trip_3 = Trip.create(title: "The Big Apple", destination: "New York City, NY", mileage: 850)
      @trip_4 = Trip.create(title: "Bike n’ Climb", destination: "Moab, UT", mileage: 700)

    end

    it "shows a list of all trips in my database, sorted in ascending order of their mileage" do

      visit "/trips"

      expect(page).to have_content(@trip_1.title)
      expect(page).to have_content(@trip_2.title)
      expect(page).to have_content(@trip_3.title)
      expect(page).to have_content(@trip_4.title)

      expect(@trip_2.title).to appear_before(@trip_4.title)
      expect(@trip_4.title).to appear_before(@trip_3.title)
      expect(@trip_3.title).to appear_before(@trip_1.title)
      expect(@trip_1.title).to_not appear_before(@trip_3.title)


    end
  end
end
