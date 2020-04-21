require 'rails_helper'

RSpec.describe "travelers show page", type: :feature do
  describe "as a visitor, when i visit a traveler's show page" do
    before(:each) do
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
    end

    it "i see the traveler's name and age" do
      visit "/travelers/#{@traveler5.id}"

      expect(page).to have_content("#{@traveler5.name}")
      expect(page).to have_content("#{@traveler5.age}")
      expect(page).to_not have_content("#{@traveler1.name}")
      expect(page).to_not have_content("#{@traveler1.age}")
      expect(page).to_not have_content("#{@traveler2.name}")
      expect(page).to_not have_content("#{@traveler2.age}")
      expect(page).to_not have_content("#{@traveler3.name}")
      expect(page).to_not have_content("#{@traveler3.age}")
      expect(page).to_not have_content("#{@traveler4.name}")
      expect(page).to_not have_content("#{@traveler4.age}")
    end

    it "i see all of the titles of the trips this traveler is on" do
      visit "/travelers/#{@traveler5.id}"

      expect(page).to have_content("#{@trip3.title}")
      expect(page).to have_content("#{@trip3.mileage}")
      expect(page).to have_content("#{@trip4.title}")
      expect(page).to have_content("#{@trip4.mileage}")
      expect(page).to_not have_content("#{@trip1.title}")
      expect(page).to_not have_content("#{@trip2.title}")
      expect(page).to_not have_content("#{@trip5.title}")
    end

    it "i see the average mileage for all of that traveler's trips" do
      visit "/travelers/#{@traveler5.id}"

      expect(page).to have_content("Average Trip Mileage")
      expect(page).to have_content("#{@traveler5.trip_avg} miles")
    end
  end
end
