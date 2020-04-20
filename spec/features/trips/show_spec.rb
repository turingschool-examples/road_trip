require 'rails_helper'

RSpec.describe "As a visitor" do
  before(:each) do
    @trip1 = Trip.create(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
    @trip2 = Trip.create(title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
    @trip3 = Trip.create(title: "The Big Cheese", destination: "Madison, WI", mileage: 850)
    @trip4 = Trip.create(title: "Cheese n’ Climb", destination: "Madison, WI", mileage: 700)
    @traveler1 = @trip1.travelers.create(name: "Sally Sue", age: 25)
    @traveler2 = @trip1.travelers.create(name: "Tommy Tom", age: 46)
    @traveler3 = @trip2.travelers.create(name: "Cory Cory", age: 19)
    @traveler4 = @trip3.travelers.create(name: "Mary Mae", age: 44)
    @traveler5 = @trip4.travelers.create(name: "Smith John", age: 9)
  end

  it "I can view a trip" do
    visit "/trips/#{@trip1.id}"

    within('#trip-information') do
      expect(page).to have_content("#{@trip1.title} Information")
      expect(page).to have_content("Destination: #{@trip1.destination}")
      expect(page).to have_content("Mileage: #{@trip1.mileage}")
    end

    within('.travelers') do
      expect(page).to have_content("Travelers")
      within("#traveler-#{@traveler1.id}") do
        expect(page).to have_content(@traveler1.name)
        expect(page).to have_button("Remove Traveler")
      end
      within("#traveler-#{@traveler2.id}") do
        expect(page).to have_content(@traveler2.name)
        expect(page).to have_button("Remove Traveler")
      end
      expect(page).to have_no_content(@traveler3.name)
      expect(page).to have_no_content(@traveler4.name)
      expect(page).to have_no_content(@traveler5.name)
    end
  end

  it "I can see similar trips" do
    visit "/trips/#{@trip1.id}"

    within('#similar-trips') do
      expect(page).to have_content("Similar Trips")
      expect(page).to have_no_content(@trip1.title)
      expect(page).to have_no_content(@trip2.title)
      expect(page).to have_link(@trip3.title, href: "/trips/#{@trip3.id}")
      expect(page).to have_link(@trip4.title, href: "/trips/#{@trip4.id}")
    end
  end
end