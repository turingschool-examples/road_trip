require "rails_helper"

RSpec.describe "When I visit a trips show page", type: :feature do
  before(:each) do
    @trip1 = Trip.create!(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
    @trip2 = Trip.create!(title: "Who is America Anyway?", destination_city: "Washington, D.C.", mileage: 300)
    @trip3 = Trip.create!(title: "Trip3 Title", destination_city: "Madison, WI", mileage: 300)
    @trip4 = Trip.create!(title: "Trip4 Title", destination_city: "Madison, WI", mileage: 300)

    @traveler1 = Traveler.create!(name: "Sally Sue", age: 25)
    @traveler2 = Traveler.create!(name: "Tommy Tom", age: 46)
    @traveler3 = Traveler.create!(name: "Cory Cory", age: 19)
    @traveler4 = Traveler.create!(name: "Mary Mae", age: 44)
    @traveler5 = Traveler.create!(name: "Smith John", age: 9)

    @trip1.traveler_trips.create!(traveler: @traveler1)
    @trip1.traveler_trips.create!(traveler: @traveler2)
    @trip1.traveler_trips.create!(traveler: @traveler3)
    @trip2.traveler_trips.create!(traveler: @traveler3)
    @trip2.traveler_trips.create!(traveler: @traveler4)
    @trip2.traveler_trips.create!(traveler: @traveler5)
  end
  it "I can see that trips title, destination city, mileage" do
    visit "/trips/#{@trip1.id}"

    expect(page).to have_content(@trip1.title)
    expect(page).to have_content(@trip1.destination_city)
    expect(page).to have_content(@trip1.mileage)

    expect(page).to have_no_content(@trip2.title)
    expect(page).to have_no_content(@trip2.destination_city)
    expect(page).to have_no_content(@trip2.mileage)
  end

  it "I see a list of the names of the travelers that are on this trip" do
    visit "/trips/#{@trip1.id}"

    within(".travelers-list") do
      expect(page).to have_content(@traveler1.name)
      expect(page).to have_content(@traveler2.name)
      expect(page).to have_content(@traveler3.name)
    end

    expect(page).to have_no_content(@traveler4.name)
    expect(page).to have_no_content(@traveler5.name)
  end

  it "Next to each traveler’s name, I see a button to remove that traveler from the trip" do
    visit "/trips/#{@trip1.id}"

    within(".travelers-list") do
      within("#traveler-#{@traveler1.id}") do
        expect(page).to have_button("Remove from Trip")
      end
      within("#traveler-#{@traveler2.id}") do
        expect(page).to have_button("Remove from Trip")
      end
      within("#traveler-#{@traveler3.id}") do
        expect(page).to have_button("Remove from Trip")
      end
    end
  end

  it "I can click button to remove traveler, I am redirected back to show and no longer see traveler on list." do
    visit "/trips/#{@trip1.id}"

    within("#traveler-#{@traveler1.id}") do
      click_button "Remove from Trip"
    end

    expect(current_path).to eql("/trips/#{@trip1.id}")

    expect(page).to have_no_css("#traveler-#{@traveler1.id}")
    expect(page).to have_css("#traveler-#{@traveler2.id}")
    expect(page).to have_css("#traveler-#{@traveler3.id}")
  end

  it "I see a list of other trips that are to the same destination, not including this trip" do
    visit "/trips/#{@trip1.id}"

    expect(page).to have_content("Other Trips to this Destination")

    within(".similar-trips") do
      expect(page).to have_no_content(@trip1.title)
      expect(page).to have_content(@trip3.title)
      expect(page).to have_content(@trip4.title)
    end
  end

  it "I can click on title of similar trip and be taken to trips show page" do
    visit "/trips/#{@trip1.id}"
    
    within(".similar-trips") do
      expect(page).to have_link(@trip3.title)
      click_link(@trip4.title)
    end

    expect(current_path).to eql("/trips/#{@trip4.id}")
  end

end
