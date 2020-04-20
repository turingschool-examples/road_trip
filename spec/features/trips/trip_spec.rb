require 'rails_helper'

RSpec.describe 'TRIPS: ', type: :feature do
  before(:each) do
    @trip_1 = Trip.create(  title: "Shoreline Ampitheatre",
                            destination_city: "Mountain View, CA",
                            mileage: 1200)
    @trip_2 = Trip.create(  title: "Winterland Ballroom",
                            destination_city: "San Francisco, CA",
                            mileage: 1250)
    @trip_3 = Trip.create(  title: "Madison Square Garden",
                            destination_city: "New York City, NY",
                            mileage: 1800)
    @trip_4 = Trip.create(  title: "Red Rocks",
                            destination_city: "Morrison, CO",
                            mileage: 25)
    @traveler_1 = Traveler.create(  name: "Jack Straw",
                                    age: 25)
    @traveler_2 = Traveler.create(  name: "Casey Jones",
                                    age: 46)
    @traveler_3 = Traveler.create(  name: "Uncle John",
                                    age: 19)
    @traveler_4 = Traveler.create(  name: "Stella Blue",
                                    age: 44)
    @traveler_5 = Traveler.create(  name: "Bertha",
                                    age: 9)


  end
  describe 'as a visitor when I visit the Trips Index Page I ' do
    it 'can see the title of all trips in ascending mileage order' do
      visit '/trips'

      expect(page).to have_content(@trip_1.title)
      expect(page).to have_content(@trip_1.destination_city)
      expect(page).to have_content(@trip_1.mileage)

      expect(page).to have_content(@trip_2.title)
      expect(page).to have_content(@trip_3.destination_city)
      expect(page).to have_content(@trip_4.mileage)

      expect(page.text.index(@trip_4.title)).to be < page.text.index(@trip_1.title)
      expect(page.text.index(@trip_1.title)).to be < page.text.index(@trip_2.title)
      expect(page.text.index(@trip_2.title)).to be < page.text.index(@trip_3.title)
    end
  end
end
