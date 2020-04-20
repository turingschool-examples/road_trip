require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "When I visit /trips" do
    before :each do
      @trip1 = Trip.create(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
      @trip2 = Trip.create(title: "“Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
      @trip3 = Trip.create(title: "The Big Apple", destination: "Moab, UT", mileage: 700)
      @trip4 = Trip.create(title: "Bike n’ Climb", destination: "New York City, NY", mileage: 850)
      @trip5 = Trip.create(title: "New Years Eve 2022", destination: "New York City, NY", mileage: 850)
      @trip6 = Trip.create(title: "Bushwig 2021", destination: "New York City, NY", mileage: 850)

      @traveler1 = Traveler.create(name: "Sally Sue", age: 25)
      @traveler2 = Traveler.create(name: "Tommy Tom", age: 46)
      @traveler3 = Traveler.create(name: "Cory Cory", age: 19)
      @traveler4 = Traveler.create(name: "Mary Mae", age: 44)
      @traveler5 = Traveler.create(name: "Smith John", age: 9)

      @trip1.travelers << [@traveler1, @traveler2]
      @trip2.travelers << [@traveler1, @traveler3]
      @trip4.travelers << [@traveler4]
    end
    it "I can click on a trips title, which takes me to the trip show page
        I see trip info and traveler names" do
      visit "/trips"

      click_link "#{@trip1.title}"

      expect(current_path).to eq("/trips/#{@trip1.id}")

      expect(page).to have_content(@trip1.title)
      expect(page).to have_content(@trip1.destination)
      expect(page).to have_content(@trip1.mileage)

      expect(page).to have_content(@traveler1.name)
      expect(page).to have_content(@traveler2.name)
      expect(page).to have_no_content(@traveler3.name)
      expect(page).to have_no_content(@traveler4.name)
      expect(page).to have_no_content(@traveler5.name)
    end
    it "When a click on a trips title, I see a section called 'Other Trips to this Destination'
        And under that title, I see a list of trip titles and links with the same destination" do

      visit "/trips"

      click_link "#{@trip4.title}"

      expect(current_path).to eq("/trips/#{@trip4.id}")

      expect(page).to have_content("Other Trips to this Destination")
      within(".similar-trips") do
        expect(page).to have_no_link("#{@trip4.title}")
        expect(page).to have_link("#{@trip5.title}", href: "/trips/#{@trip5.id}")
        expect(page).to have_link("#{@trip6.title}", href: "/trips/#{@trip6.id}")
      end
    end

  end
end