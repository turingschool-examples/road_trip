require 'rails_helper'

RSpec.describe "as a visitor I see similar trips on a trips show page" do

  before(:each) do
    @trip_1 = Trip.create(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
    @trip_2 = Trip.create(title: "Who is America Anyway?", destination_city: "Washington, D.C", mileage: 300)
    @trip_3 = Trip.create(title: "The Big Apple", destination_city: "New York City, NY", mileage: 850)
    @trip_4 = Trip.create(title: "Bike n’ Climb", destination_city: "Moab, UT", mileage: 700)
    @trip_5 = Trip.create(title: "The land of over 14,000 lakes", destination_city: "Madison, WI", mileage: 450)
    @trip_6 = Trip.create(title: "A Winter Wonderland For Trout", destination_city: "Madison, WI", mileage: 175)
    @trip_7 = Trip.create(title: "Snowmobile Heaven!", destination_city: "Madison, WI", mileage: 200)
  end

  describe " when I visit a trips show page I see a section of the page titled 'Other trips to this destination'" do
    it "I see all other trip titles that have the same destination as this trip (not including the currrent trip)" do

      visit "/trips/#{@trip_1.id}"

      expect(page).to have_content("Other Trips to this Destination")

      within ".other-trips" do
        expect(page).to have_content("#{@trip_5.title}")
        expect(page).to have_content("#{@trip_6.title}")
        expect(page).to have_content("#{@trip_7.title}")
        expect(page).to_not have_content("#{@trip_1.title}")
        expect(page).to_not have_content("#{@trip_2.title}")
        expect(page).to_not have_content("#{@trip_3.title}")
      end
    end

    it "all the names of the similar trips are links to that trips show page" do

      visit "/trips/#{@trip_1.id}"

      within ".other-trips" do
        expect(page).to have_link("#{@trip_5.title}")
        expect(page).to have_link("#{@trip_6.title}")

        click_link("#{@trip_7.title}")

        expect(current_path).to eq("/trips/#{@trip_7.id}")
      end
    end
  end
end
