require "rails_helper"

RSpec.describe "As a visitor" do
  context "when I visit a traveler's show page" do
    before :each do
      @trip1 = Trip.create!(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
      @trip2 = Trip.create!(title: "The Big Apple", destination: "New York City, NY", mileage: 850)

      @traveler1 = Traveler.create!(name: "Sally Sue", age: 25)

      TravelerTrip.create!(trip_id: @trip1.id, traveler_id: @traveler1.id)
      TravelerTrip.create!(trip_id: @trip2.id, traveler_id: @traveler1.id)
    end

    it "I see the traveler’s name and age
    And I see all of the titles of the trips that this traveler is on
    And I also see the average mileage of all of that traveler’s road trips" do
      visit "/travelers/#{@traveler1.id}"

      expect(page).to have_content(@traveler1.name)
      expect(page).to have_content(@traveler1.age)

      expect(page).to have_content(((1100.0 + 850.0)/2).round(1))

      within "#trip-#{@trip1.id}" do
        expect(page).to have_content(@trip1.title)
      end

      within "#trip-#{@trip2.id}" do
        expect(page).to have_content(@trip2.title)
      end
    end
  end
end
