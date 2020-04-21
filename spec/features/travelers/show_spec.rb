require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do 
  describe "when I visit a traveler's show page" do 
    before :each do 
      @trip1 = Trip.create!(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
      @trip2 = Trip.create!(title: "The Big Apple", destination: "New York City, NY", mileage: 850)
      @trip3 = Trip.create!(title: "Indianapolis Motor Speedway", destination: "Speedway, IN", mileage: 1000)
      @trip4 = Trip.create!(title: "Rocky Mountain National Park", destination: "Estes Park, CO", mileage: 100)
      @traveler1 = Traveler.create!(name: "Sally Sue", age: 25)
      @traveler2 = Traveler.create!(name: "Cory Cory", age: 19)
      TravelerTrip.create(trip: @trip1, traveler: @traveler1)
      TravelerTrip.create(trip: @trip2, traveler: @traveler1)
      TravelerTrip.create(trip: @trip3, traveler: @traveler2)
      TravelerTrip.create(trip: @trip4, traveler: @traveler2)
    end

    it "then I see traveler's name, age, all the trips they're on, and the average miles for all the trips the traveler is on." do
      visit traveler_path(@traveler1.id)

      within ".traveler-info" do 
        expect(page).to have_content("Name: Sally Sue")
        expect(page).to have_content("Age: 25")
        expect(page).to_not have_content("Name: Cory Cory")
        expect(page).to_not have_content("Age: 19")
      end

      within ".traveler-trips" do 
        expect(page).to have_content("Cheese Tour 2020")
        expect(page).to have_content("The Big Apple")
        expect(page).to_not have_content("Rocky Mountain National Park")
      end

      within ".average-mileage" do 
        expect(page).to_not have_content("Average Trip Mileage: 550")
        expect(page).to have_content("Average Trip Mileage: 975")
      end

      visit traveler_path(@traveler2.id)

      within ".average-mileage" do 
        expect(page).to have_content("Average Trip Mileage: 550")
        expect(page).to_not have_content("Average Trip Mileage: 975")
      end
    end

    it "then I can use a form to add a trip to a traveler." do 
      visit traveler_path(@traveler1.id)

      within ".traveler-trips" do 
        expect(page).to have_content("Cheese Tour 2020")
        expect(page).to have_content("The Big Apple")
      end

      within ".add-trip" do 
        fill_in :trip_id, with: @trip3.id
        click_on "Submit"
      end

      within ".traveler-trips" do 
        expect(page).to have_content("Cheese Tour 2020")
        expect(page).to have_content("The Big Apple")
        expect(page).to have_content("Indianapolis Motor Speedway")
      end

      visit traveler_path(@traveler2.id)

      within ".traveler-trips" do 
        expect(page).to have_content("Rocky Mountain National Park")
        expect(page).to have_content("Indianapolis Motor Speedway")
      end

      within ".add-trip" do 
        fill_in :trip_id, with: @trip2.id
        click_on "Submit"
      end

      within ".traveler-trips" do 
        expect(page).to have_content("Rocky Mountain National Park")
        expect(page).to have_content("Indianapolis Motor Speedway")
        expect(page).to have_content("The Big Apple")
      end
    end
  end
end