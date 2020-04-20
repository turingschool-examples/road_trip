require 'rails_helper'

RSpec.describe "as a visitor" do
  describe "When I visit a trips show page" do
    before(:each) do

      @trip_1 = Trip.create(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
      @trip_2 = Trip.create(title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
      @trip_3 = Trip.create(title: "The Big Apple", destination: "New York City, NY", mileage: 850)
      @trip_4 = Trip.create(title: "Bike n’ Climb", destination: "Moab, UT", mileage: 700)

      @traveler_1 = Traveler.create(name: "Tommy Tom", age: 46)
      @traveler_2 = Traveler.create(name: "Cory Cory", age: 19)
      @traveler_3 = Traveler.create(name: "Mary Mae", age: 44)
      @traveler_4 = Traveler.create(name: "Smith John", age: 9)

      TravelerTrip.create!(trip: @trip_1, traveler: @traveler_1)
      TravelerTrip.create!(trip: @trip_1, traveler: @traveler_4)

    end

    it "the trip show page shows the trips title, destination city, mileage, and travelers" do
      visit "/trips/#{@trip_1.id}"

      expect(page).to have_content(@trip_1.title)
      expect(page).to have_content(@trip_1.destination)
      expect(page).to have_content(@trip_1.mileage)
      expect(page).to have_content(@traveler_1.name)
      expect(page).to have_content(@traveler_4.name)

      expect(page).to_not have_content(@trip_2.title)
      expect(page).to_not have_content(@trip_3.title)
      expect(page).to_not have_content(@trip_4.title)
      expect(page).to_not have_content(@traveler_3.name)
      expect(page).to_not have_content(@traveler_2.name)
    end

    it "has a link to remove each traveler from the trip" do
      visit "/trips/#{@trip_1.id}"

      within "#traveler-#{@traveler_1.id}" do
        expect(page).to have_link("Remove This Traveler")
      end

      within "#traveler-#{@traveler_4.id}" do
        expect(page).to have_link("Remove This Traveler")
      end
    end

    it "I can remove a traveler from a trip" do
      visit "/trips/#{@trip_1.id}"

      within "#traveler-#{@traveler_4.id}" do
        click_link "Remove This Traveler"
      end

      expect(current_path).to eq("/trips/#{@trip_1.id}")
      expect(page).to have_content("Smith John has been removed from this trip")
      expect(page).to have_content(@traveler_1.name)
    end
  end
end
