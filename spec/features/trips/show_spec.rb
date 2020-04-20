require 'rails_helper'

RSpec.describe 'As a visitor' do
  before(:each) do
    @trip1 = Trip.create!(title: 'Cheese Tour 2020', destination_city: 'Madison, WI', mileage: 1100)
    @trip2 = Trip.create!(title: 'Who is America Anyway?', destination_city: 'Washington, D.C.', mileage: 300)

    @traveler1 = @trip1.travelers.create!(name: 'Sally Sue', age: 25)
    @traveler2 = @trip1.travelers.create!(name: 'Tommy Tom', age: 46)
    @traveler3 = @trip1.travelers.create!(name: 'Cory Cory', age: 19)
    @traveler4 = @trip1.travelers.create!(name: 'Mary Mae', age: 44)
    @traveler5 = @trip1.travelers.create!(name: 'Smith John', age: 9)

  end

  describe 'When I visit a trips index page' do
    it 'I can click on a trips title to go to trip show' do
      visit "/trips"

      click_link @trip1.title

      expect(current_path).to eql("/trips/#{@trip1.id}")
    end

    it 'I can see the trip info & a list of travelers on this trip' do
      visit "/trips/#{@trip1.id}"

      expect(page).to have_content(@trip1.title)
      expect(page).to have_content(@trip1.destination_city)
      expect(page).to have_content(@trip1.mileage)

      expect(page).to have_content("All Travelers:")
      within(".trip-travelers") do
        expect(page).to have_content(@traveler1.name)
        expect(page).to have_content(@traveler2.name)
        expect(page).to have_content(@traveler3.name)
      end
    end
  end
end
