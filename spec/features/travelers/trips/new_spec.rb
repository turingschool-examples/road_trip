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

    describe "i see see a form to add a trip id and when i do and hit submit" do
      it "i'm redirected to the traveler's show page and see the trip has been added" do
        visit "/travelers/#{@traveler1.id}"

        expect(page).to have_content("#{@trip1.title}")
        expect(page).to have_content("#{@trip1.mileage}")
        expect(page).to have_content("#{@trip3.title}")
        expect(page).to have_content("#{@trip3.mileage}")
        expect(page).to_not have_content("#{@trip4.title}")
        expect(page).to_not have_content("#{@trip4.mileage}")
        expect(page).to have_content("Add a Trip")

        fill_in :trip_id, with: "#{@trip4.id}"
        click_button("Submit")

        expect(current_path).to eq("/travelers/#{@traveler1.id}")
        expect(page).to have_content("#{@trip1.title}")
        expect(page).to have_content("#{@trip1.mileage}")
        expect(page).to have_content("#{@trip3.title}")
        expect(page).to have_content("#{@trip3.mileage}")
        expect(page).to have_content("#{@trip4.title}")
        expect(page).to have_content("#{@trip4.mileage}")
      end
    end
  end
end
