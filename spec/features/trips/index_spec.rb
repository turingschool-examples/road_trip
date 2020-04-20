require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "When I visit /trips" do
    before :each do
      @trip1 = Trip.create(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
      @trip2 = Trip.create(title: "“Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
      @trip3 = Trip.create(title: "The Big Apple", destination: "Moab, UT", mileage: 700)
      @trip4 = Trip.create(title: "Bike n’ Climb", destination: "New York City, NY", mileage: 850)

      @traveler1 = Traveler.create(name: "Sally Sue", age: 25)
      @traveler2 = Traveler.create(name: "Tommy Tom", age: 46)
      @traveler3 = Traveler.create(name: "Cory Cory", age: 19)
      @traveler4 = Traveler.create(name: "Mary Mae", age: 44)
      @traveler5 = Traveler.create(name: "Smith John", age: 9)

      @trip1.travelers << [@traveler1, @traveler2]
      @trip2.travelers << [@traveler1, @traveler3]
      @trip4.travelers << [@traveler4]
    end
    it "I see titles of all trips listed in order of their mileage (asc order)" do
      visit trips_path

      within '.trips' do
        expect(page.all('.trip-info')[0]).to have_content("#{@trip2.title}")
        expect(page.all('.trip-info')[1]).to have_content("#{@trip3.title}")
        expect(page.all('.trip-info')[2]).to have_content("#{@trip4.title}")
        expect(page.all('.trip-info')[3]).to have_content("#{@trip1.title}")
      end
    end
  end
end