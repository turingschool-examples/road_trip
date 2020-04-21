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
  end
end

# As a visitor
# When I visit a traveler’s show page
# I see the traveler’s name and age
# And I see all of the titles of the trips that this traveler is on
# And I also see the average mileage of all of that traveler’s road trips