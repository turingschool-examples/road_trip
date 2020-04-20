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

    @traveler1 = Traveler.create( name: "Sally Sue",
                                  age: 25)

    @traveler2 = Traveler.create( name: "Tommy Tom",
                                  age: 46)

    @traveler3 = Traveler.create( name: "Cory Cory",
                                  age: 19)

    @traveler4 = Traveler.create( name: "Mary Mae",
                                  age: 44)

    @traveler5 = Traveler.create( name: "Smith John",
                                  age: 9)

    TravelerTrip.create(traveler: @traveler1, trip: @trip1)
    TravelerTrip.create(traveler: @traveler2, trip: @trip1)
    TravelerTrip.create(traveler: @traveler3, trip: @trip1)

    visit "/trips"
  end

  describe "when I visit a trips index page" do
    it "
    And I click on a trips title
    I’m taken to that trip’s show page
    And I can see that trips title, destination city, mileage
    And I also see a list of the names of the travelers that are on this trip" do
      within "#trip-#{@trip1.id}" do
        click_link @trip1.title
      end

      expect(page).to have_current_path("/trips/#{@trip1.id}")

      expect(page).to have_content(@trip1.title)
      expect(page).to have_content(@trip1.destination_city)
      expect(page).to have_content(@trip1.mileage)

      within "#traveler-#{@traveler1id}" do
        expect(page).to have_content(@traveler1.name)
      end
      within "#traveler-#{@traveler2.id}" do
        expect(page).to have_content(@traveler2.name)
      end
      within "#traveler-#{@traveler3.id}" do
        expect(page).to have_content(@traveler3.name)
      end
    end
  end
end

# As a visitor
# When I visit a trips index page
# And I click on a trips title
# I’m taken to that trip’s show page
# And I can see that trips title, destination city, mileage
# And I also see a list of the names of the travelers that are on this trip
