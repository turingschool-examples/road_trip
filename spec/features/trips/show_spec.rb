require "rails_helper"

RSpec.describe "As a visitor", type: :feature do

  before :each do
    @trip_1 = Trip.create!(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
    @trip_2 = Trip.create!(title: "That 70's Tour", destination_city: "Madison, WI", mileage: 300)
    @trip_3 = Trip.create!(title: "Great Lakes Vista", destination_city: "Madison, WI", mileage: 800)
    @trip_4 = Trip.create!(title: "Frigid Heights", destination_city: "Madison, WI", mileage: 750)

    @trip_5 = Trip.create!(title: "Who is America Anyway?", destination_city: "Washington, D.C.", mileage: 300)
    @trip_6 = Trip.create!(title: "The Big Apple", destination_city: "New York City, NY", mileage: 850)
    @trip_7 = Trip.create!(title: "Bike n’ Climb", destination_city: "Moab, UT", mileage: 700)

    @traveler_1 = @trip_1.travelers.create(name: "Sally Sue", age: 25)
    @traveler_2 = @trip_1.travelers.create(name: "Tommy Tom", age: 46)
    @traveler_3 = @trip_2.travelers.create(name: "Cory Cory", age: 19)
  end

  it "I can click on a trip title and view that trips show page" do
    visit trips_path

    click_link "#{@trip_1.title}"

    expect(current_path).to eq(trip_path(@trip_1))

    expect(page).to have_content(@trip_1.title)
    expect(page).to have_content("Destination City: #{@trip_1.destination_city}")
    expect(page).to have_content("Mileage: #{@trip_1.mileage}")

    expect(page).to have_content(@traveler_1.name)
    expect(page).to have_content(@traveler_2.name)
    expect(page).to_not have_content(@traveler_3.name)
  end

  it "I can remove a traveler from a trip" do
    visit trip_path(@trip_1)

    within "#traveler-#{@traveler_1.id}" do
      expect(page).to have_button("Remove")
    end

    within "#traveler-#{@traveler_2.id}" do
      click_button "Remove"
    end

    expect(current_path).to eq(trip_path(@trip_1))
    expect(page).to have_content(@traveler_1.name)
    expect(page).to_not have_content(@traveler_2.name)
  end

  it "I can see similar trips" do
    similar_trips = [@trip_2, @trip_3, @trip_4]
    visit trip_path(@trip_1)

    expect(page).to have_content("Other Trips to this Destination")

    within ".similar-trips" do
      expect(page).to_not have_content(@trip_1.title)

      similar_trips.each do |trip|
        within "#trip-#{trip.id}" do
          expect(page).to have_link("#{trip.title}")
        end
      end

      within "#trip-#{@trip_2.id}" do
        click_link("#{@trip_2.title}")
      end
    end

    expect(current_path).to eq(trip_path(@trip_2))
  end

end
