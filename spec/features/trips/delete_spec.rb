require 'rails_helper'


RSpec.describe "As a visitor", type: :feature do 
  describe "When I click on the remove traveler button" do 
    before :each do
      Traveler1 = Traveler.create!( name: "Sally Sue", age: 25)
      Traveler2 = Traveler.create!(name: "Tommy Tom", age: 46)
      Traveler3 = Traveler.create!(name: "Cory Cory", age: 19)
      Traveler4 = Traveler.create!(name: "Mary Mae", age: 44)
      Traveler5 = Traveler.create!(name: "Smith John", age: 9)
      Trip1 = Traveler1.trips.create!(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
      Trip2 = Traveler2.trips.create!(title: "Who is America Anyway?", destination_city: "Washington, D.C.", mileage: 300)
      Trip3 = Traveler2.trips.create!(title: "The Big Apple", destination_city: "New York City, NY", mileage: 850)
      Trip4 = Traveler3.trips.create!(title: "Bike n’ Climb", destination_city: "Moab, UT", mileage: 700)
    end

    it "I am redirected back to the trips show page and the traveler is no longer there" do 
      visit "/trips/#{Trip1.id}"

      click_button"Remove Traveler"

      expect(current_path).to eq("/trips/#{Trip1.id}") 
      save_and_open_page
    end
  end
end