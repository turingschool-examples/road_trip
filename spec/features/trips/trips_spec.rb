require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do

  before(:each) do
    @trip1 = Trip.create(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
    @trip2 = Trip.create(title: "Who is America Anyway?", destination_city: "Washington, D.C", mileage: 300)
    @trip3 = Trip.create(title: "The Big Apple", destination_city: "New York City, NY", mileage: 850)
    @trip4 = Trip.create(title: "Bike n' Climb", destination_city: "Moab UT", mileage: 700)
  end

  it "can visit a trips index page" do
    visit "/trips"
    expect(page.all('.trip')[0]).to have_content("#{@trip2.title}: #{@trip2.mileage} miles")
    expect(page.all('.trip')[1]).to have_content("#{@trip4.title}: #{@trip4.mileage} miles")
    expect(page.all('.trip')[2]).to have_content("#{@trip3.title}: #{@trip3.mileage} miles")
    expect(page.all('.trip')[3]).to have_content("#{@trip1.title}: #{@trip1.mileage} miles")
  end

end
