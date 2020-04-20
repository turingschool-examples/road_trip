require 'rails_helper'

RSpec.describe Trip do
  before :each do
    @trip1 = Trip.create!(title: "Fun", destination: "Madison", mileage: 300)
    @trip2 = Trip.create!(title: "Exciting", destination: "Nashville", mileage: 200)
    @trip3 = Trip.create!(title: "OK", destination: "Madison", mileage: 100)
    @trip4 = Trip.create!(title: "Fine", destination: "Madison", mileage: 120)
  end

  describe 'relationships' do
    it {should have_many :traveler_trips}
    it {should have_many(:travelers).through(:traveler_trips)}
  end

  describe 'instance methods' do
    it '#other_trips' do
      expect(@trip1.other_trips).to match_array([@trip3, @trip4])
    end
  end

end
