require "rails_helper"

RSpec.describe "As a visitor", type: :feature do
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

    visit "/trips"
  end

  describe "when I visit a trips index page" do
    it "I see the titles of all trips in my database listed in order of their mileage (ascending order)" do
      within "#trip-#{@trip1.id}" do
        expect(page).to have_content(@trip1.title)
      end


      within "#trip-#{@trip2.id}" do
        expect(page).to have_content(@trip2.title)
      end


      within "#trip-#{@trip3.id}" do
        expect(page).to have_content(@trip3.title)
      end


      within "#trip-#{@trip4.id}" do
        expect(page).to have_content(@trip4.title)
      end
    end

    it
  end
end

#
# As a visitor
# When I visit a trips index page
# I see the titles of all trips in my database listed in order of their mileage (ascending order)
