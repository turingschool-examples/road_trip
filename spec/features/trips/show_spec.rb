require 'rails_helper'

RSpec.describe 'As a visitor' do
  before(:each) do
    @trip1 = Trip.create!(title: 'Cheese Tour 2020', destination_city: 'Madison, WI', mileage: 1100)
    @trip2 = Trip.create!(title: 'Who is America Anyway?', destination_city: 'Washington, D.C.', mileage: 300)

    visit "/trips/#{@trip1.id}"
  end

  describe 'When I visit a trips index page' do
    it 'I can click on a trips title to go to trip show' do
      click_link "Cheese Tour 2020"

      expect(current_path).to eql("/trips/#{@trip1.id}")
    end

    it 'I can see the trip info & a list of travelers on this trip' do
      expect(page).to have_content(trip1.title)
      expect(page).to have_content(trip1.destination_city)
      expect(page).to have_content(trip1.mileage)

      expect(page).to have_content("All Travelers")
      within(".trip-travelers") do
        expect(page).to have_content(traveler1.name)
        expect(page).to have_content(traveler2.name)
        expect(page).to have_content(traveler3.name)
      end
    end
  end
end
