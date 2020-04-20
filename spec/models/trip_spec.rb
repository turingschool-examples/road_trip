require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :destination_city }
    it { should validate_presence_of :mileage }

  end

  describe 'relationships' do
    it {should have_many :traveler_trips}
    it {should have_many(:travelers).through(:traveler_trips)}

  end

  describe 'class methods' do
    it 'trip order' do
    trip1 = Trip.create(title: "Cheese Tour 2020",
                        destination_city: "Madison WI",
                        mileage: 1100)

    trip2 = Trip.create(title: "Who is America Anyway?",
                        destination_city: "Washington, D.C.",
                        mileage: 300)

    trip3 = Trip.create(title: "The Big Apple",
                        destination_city: "New York City, NY",
                        mileage: 850)

    expect(Trip.trip_order).to eq([trip2, trip3, trip1])
    end
  end
end