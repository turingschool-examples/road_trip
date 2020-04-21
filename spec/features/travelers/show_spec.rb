require 'rails_helper'

RSpec.describe "As a visitor", tyoe: :feature do 
  describe "when I visit a travelers show page" do 
    it "I can see the travelers name and age and their avg mileage" do 
      trip1 = Trip.create!(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
      trip2 = Trip.create!(title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
      trip3 = Trip.create!(title: "The Big Apple", destination: "New York City, NY", mileage: 850)
      trip4 = Trip.create!(title: "Bike n’ Climb", destination: "Moab, UT", mileage: 700)
      trip5 = Trip.create!(title: "Arches", destination: "Moab, UT", mileage: 900)
      traveler1 = Traveler.create!(name: "Sally Sue", age: 25)
      traveler2 = Traveler.create!(name: "Tommy Tom", age: 46)
      traveler3 = Traveler.create!(name: "Cory Cory", age: 19)
      traveler4 = Traveler.create!(name: "Mary Mae", age: 44)
      traveler5 = Traveler.create!(name: "Smith John", age: 9)
      TravelerTrip.create!(trip_id: trip1.id, traveler_id: traveler1.id)
      TravelerTrip.create!(trip_id: trip1.id, traveler_id: traveler2.id)
      TravelerTrip.create!(trip_id: trip1.id, traveler_id: traveler3.id)

      visit "/travelers/#{traveler1.id}"

      expect(page).to have_content("Name: #{traveler1.name}") 
      expect(page).to have_content("Age: #{traveler1.age}") 
      expect(page).to have_content(trip1.title) 
      expect(page).to have_content("Average Mileage: 1100") 
    end
  end
end


# As a visitor
# When I visit a traveler’s show page
# I see the traveler’s name and age
# And I see all of the titles of the trips that this traveler is on
# And I also see the average mileage of all of that traveler’s road trips