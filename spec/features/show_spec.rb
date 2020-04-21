require 'rails_helper'

RSpec.describe 'Item Show Page' do
    before :each do

      @trip1 = Trip.create!(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
      @trip2 = Trip.create!(title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
      @trip3 = Trip.create!(title: "The Big Apple", destination: "New York City, NY", mileage: 850)
      @trip4 = Trip.create!(title: "Bike n’ Climb", destination: "Moab, UT", mileage: 700)
      @trip5 = Trip.create!(title: "Arches", destination: "Moab, UT", mileage: 900)

      @traveler1 = Traveler.create!(name: "Sally Sue", age: 25)
      @traveler2 = Traveler.create!(name: "Tommy Tom", age: 46)
      @traveler3 = Traveler.create!(name: "Cory Cory", age: 19)
      @traveler4 = Traveler.create!(name: "Mary Mae", age: 44)
      @traveler5 = Traveler.create!(name: "Smith John", age: 9)

      TravelerTrip.create!(trip_id: @trip1.id, traveler_id: @traveler1.id)
      TravelerTrip.create!(trip_id: @trip1.id, traveler_id: @traveler2.id)
      TravelerTrip.create!(trip_id: @trip1.id, traveler_id: @traveler3.id)

      TravelerTrip.create!(trip_id: @trip2.id, traveler_id: @traveler2.id)
      TravelerTrip.create!(trip_id: @trip2.id, traveler_id: @traveler3.id)

      TravelerTrip.create!(trip_id: @trip3.id, traveler_id: @traveler1.id)
      TravelerTrip.create!(trip_id: @trip3.id, traveler_id: @traveler3.id)
      TravelerTrip.create!(trip_id: @trip3.id, traveler_id: @traveler4.id)
      TravelerTrip.create!(trip_id: @trip3.id, traveler_id: @traveler5.id)

      TravelerTrip.create!(trip_id: @trip4.id, traveler_id: @traveler2.id)
      TravelerTrip.create!(trip_id: @trip4.id, traveler_id: @traveler4.id)
      TravelerTrip.create!(trip_id: @trip4.id, traveler_id: @traveler5.id)

      visit "/travelers/#{@traveler1.id}"
    end

    it "I see traveler name, age, titles of trips theyre on" do

      expect(current_path).to eq("/travelers/#{@traveler1.id}")

      expect(page).to have_content("#{@traveler1.name}")
      expect(page).to have_content("#{@traveler1.age}")

      expect(page).to have_content("#{@trip1.title}")
      expect(page).to have_content("#{@trip3.title}")

      expect(page).to have_content("#{@traveler1.average_mileage}")
      expect(page).to_not have_content("#{@traveler4.name}")
      expect(page).to_not have_content("#{@traveler4.age}")
    end

    it "I see an add trip section with a form, if I enter an existing trip id, that trip is addeßd" do

      expect(page).to have_content("Add Trip")

      fill_in 'trip_id', with: "#{@trip4.id}"

      click_button "Submit"

      save_and_open_page

      expect(current_path).to eq("/travelers/#{@traveler1.id}")
      expect(page).to have_content("#{@trip4.title}")
    end
end
