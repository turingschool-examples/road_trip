require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do 
  describe "when I visit a traveler's show page" do 
    it "I see traveler's name, age, all the trips they're on, and the average miles for all the trips the traveler is on." do 
      trip1 = Trip.create!(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
      trip2 = Trip.create!(title: "The Big Apple", destination: "New York City, NY", mileage: 850)
      traveler1 = Traveler.create!(name: "Sally Sue", age: 25)
      TravelerTrip.create(trip: trip1, traveler: traveler1)
      TravelerTrip.create(trip: trip2, traveler: traveler1)

      visit traveler_path(traveler1.id)

      within ".traveler-info" do 
        expect(page).to have_content("Name: Sally Sue")
        expect(page).to have_content("Age: 25")
      end

      within ".traveler-trips" do 
        expect(page).to have_content("Cheese Tour 2020")
        expect(page).to have_content("The Big Apple")
      end

      within ".average-mileage" do 
        expect(page).to have_content("Average Trip Mileage: 975")
      end
    end

    it "I can use a form to add a trip to a traveler" do 
      trip1 = Trip.create!(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
      trip2 = Trip.create!(title: "The Big Apple", destination: "New York City, NY", mileage: 850)
      trip3 = Trip.create!(title: "Indianapolis Motor Speedway", destination: "Speedway, IN", mileage: 1000)
      traveler1 = Traveler.create!(name: "Sally Sue", age: 25)
      TravelerTrip.create(trip: trip1, traveler: traveler1)
      TravelerTrip.create(trip: trip2, traveler: traveler1)

      visit traveler_path(traveler1.id)

      within ".add-trip" do 
        fill_in :trip_id, with: trip3.id
        click_on "Submit"
      end

      within ".traveler-trips" do 
        expect(page).to have_content("Cheese Tour 2020")
        expect(page).to have_content("The Big Apple")
        expect(page).to have_content("Indianapolis Motor Speedway")
      end
    end
  end
end

# User Story 2, Add a Trip to a Traveler
# ​
# As a visitor
# When I visit a traveler’s show page
# I see a section on the page titled “Add a trip”
# And under that section, I see a form that allows me to enter an existing trip’s id
# When I enter the id of an existing trip into that field
# And click submit
# I’m redirected to the traveler’s show page
# Where I see the title of that trip I just added to the traveler on the page