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
    TravelerTrip.create( trip: @trip_1, traveler: @traveler_1 )
    TravelerTrip.create( trip: @trip_1, traveler: @traveler_4 )
    TravelerTrip.create( trip: @trip_1, traveler: @traveler_5 )
    TravelerTrip.create( trip: @trip_2, traveler: @traveler_1 )
    TravelerTrip.create( trip: @trip_2, traveler: @traveler_2 )
    TravelerTrip.create( trip: @trip_2, traveler: @traveler_5 )
    TravelerTrip.create( trip: @trip_3, traveler: @traveler_1 )
    TravelerTrip.create( trip: @trip_3, traveler: @traveler_2 )
    TravelerTrip.create( trip: @trip_3, traveler: @traveler_3 )
    TravelerTrip.create( trip: @trip_4, traveler: @traveler_2 )
    TravelerTrip.create( trip: @trip_4, traveler: @traveler_3 )
    TravelerTrip.create( trip: @trip_4, traveler: @traveler_4 )
  end
  describe 'as a visitor when I visit the Trips Index Page I ' do
    it 'can see the title of all trips in ascending mileage order' do
      visit '/trips'

      expect(page).to have_content(@trip_1.title)
      expect(page).to have_content(@trip_2.title)
      expect(page).to have_content(@trip_3.title)
      expect(page).to have_content(@trip_4.title)

      expect(page.text.index(@trip_4.title)).to be < page.text.index(@trip_1.title)
      expect(page.text.index(@trip_1.title)).to be < page.text.index(@trip_2.title)
      expect(page.text.index(@trip_2.title)).to be < page.text.index(@trip_3.title)
    end

    it 'can click on the title to see details on the show page' do
      visit '/trips'
      click_link @trip_1.title

      expect(page).to have_current_path("/trips/#{@trip_1.id}")
      expect(page).to have_content(@trip_1.title)
      expect(page).to have_content(@trip_1.destination_city)
      expect(page).to have_content(@trip_1.mileage)
      expect(page).to have_content(@traveler_1.name)
      expect(page).to_not have_content(@traveler_2.name)
      expect(page).to_not have_content(@traveler_3.name)
      expect(page).to have_content(@traveler_4.name)
      expect(page).to have_content(@traveler_5.name)
    end

    it 'can remove travelers from a trip' do
      visit '/trips'
      click_link @trip_1.title
      within "#traveler_#{@traveler_4.id}" do
        click_button "Remove Traveler"
      end

      expect(page).to have_current_path("/trips/#{@trip_1.id}")
      expect(page).to_not have_content(@traveler_4.name)
      expect(page).to have_content(@traveler_1.name)
      expect(page).to have_content(@traveler_5.name)
    end

    it 'can see other trips to a location' do
      trip_5 = Trip.create(  title: "Golden Gate Park",
                              destination_city: "San Francisco, CA",
                              mileage: 1250)
      trip_6 = Trip.create(  title: "Haight Ashbury",
                              destination_city: "San Francisco, CA",
                              mileage: 1250)

      visit '/trips'
      click_link @trip_2.title

      within "#other_trips" do
        expect(page).to have_link("#{trip_5.title}")
        expect(page).to have_link("#{trip_6.title}")
        expect(page).to_not have_link("#{@trip_2.title}")
      end

      click_link trip_6.title

      within "#other_trips" do
        expect(page).to have_link("#{trip_5.title}")
        expect(page).to have_link("#{@trip_2.title}")
        expect(page).to_not have_link("#{trip_6.title}")
      end
    end

    it 'sees notification if no other trips exist' do
      visit '/trips'
      click_link @trip_2.title

      within "#other_trips" do
        expect(page).to have_content("No Other Trips to This Destination")
        expect(page).to_not have_link("#{@trip_1.title}")
        expect(page).to_not have_link("#{@trip_2.title}")
        expect(page).to_not have_link("#{@trip_3.title}")
        expect(page).to_not have_link("#{@trip_4.title}")
      end
    end
  end
end
