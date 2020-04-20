require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'In the trip show page I see a button next to each travelers name' do
    it 'When I click the button that traveler is removed and I am redirected back to the trip show page' do
      trip1 = Trip.create(title: "Cheese Tour 2020",
                          destination_city: "Madison WI",
                          mileage: 1100)

      traveler1 = trip1.travelers.create(name: "Sally Sue",
                                         age: 25)

      traveler2 = trip1.travelers.create(name: "Tommy Tom",
                                         age: 46)

      traveler3 = trip1.travelers.create(name: "Cory Cory",
                                         age: 19)

      visit "/trips/#{trip1.id}"

      within "#traveler-#{traveler1.id}" do
        expect(page).to have_button('Remove Traveler')
      end

      within "#traveler-#{traveler2.id}" do
        expect(page).to have_button('Remove Traveler')
      end

      within "#traveler-#{traveler3.id}" do
        expect(page).to have_button('Remove Traveler')
        click_button 'Remove Traveler'
      end

      expect(current_path).to eq("/trips/#{trip1.id}")

      expect(page).to have_no_content(traveler3.name)

      expect(page).to have_content(traveler1.name)
      expect(page).to have_content(traveler2.name)
    end
  end
end
