require 'rails_helper'

RSpec.describe 'As a visitor' do
  before :each do
    @trip1 = Trip.create!(title: "Fun", destination: "Madison", mileage: 300)
    @trip2 = Trip.create!(title: "Exciting", destination: "Nashville", mileage: 200)
    @trip3 = Trip.create!(title: "OK", destination: "Madison", mileage: 100)
    @trip4 = Trip.create!(title: "Fine", destination: "Madison", mileage: 120)
    @traveler1 = @trip1.travelers.create!(name: "Tony", age: 45)
    @traveler2 = @trip1.travelers.create!(name: "Lisa", age: 90)
    @traveler3 = @trip1.travelers.create!(name: "Mark", age: 44)
  end
  describe 'When I visit /trips/:id' do
    it 'I see all of that trip info and all of the travelers on that trip' do
      visit "/trips/#{@trip1.id}"

      expect(page).to have_content(@trip1.title)
      expect(page).to have_content(@trip1.destination)
      expect(page).to have_content(@trip1.mileage)
      expect(page).to have_content(@traveler1.name)
      expect(page).to have_content(@traveler2.name)
      expect(page).to have_content(@traveler3.name)
    end
    it 'Next to each traveler name I see a button to remove that traveler' do
      visit "/trips/#{@trip1.id}"

      expect(page).to have_content(@traveler1.name)

      within "#traveler-#{@traveler1.id}" do
        click_button "Remove"
      end

      expect(current_path).to eq("/trips/#{@trip1.id}")
      expect(page).to_not have_content(@traveler1.name)
      expect(page).to have_content(@traveler2.name)
      expect(page).to have_content(@traveler3.name)
    end
    it 'I see other trips to this destination' do
      visit "/trips/#{@trip1.id}"

      within ".other-trips" do
        expect(page).to have_link(@trip3.title)
        expect(page).to_not have_link(@trip1.title)
        click_link @trip4.title
      end

      expect(current_path).to eq("/trips/#{@trip4.id}")
    end
  end

end
