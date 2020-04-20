require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :destination }
    it { should validate_presence_of :mileage }
  end

  describe 'relationships' do
    it { should have_many :trips_travelers }
    it { should have_many :travelers }
  end

  describe 'methods' do
    before :each do
      @trip1 = Trip.create(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
      @trip2 = Trip.create(title: "“Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
      @trip3 = Trip.create(title: "The Big Apple", destination: "New York City, NY", mileage: 700)
      @trip4 = Trip.create(title: "Bike n’ Climb", destination: "New York City, NY", mileage: 850)
    end

    describe 'class methods' do
      it 'self#order_by_mileage_asc' do
        trips = Trip.order_by_mileage_asc
        expect(trips).to eq [@trip2, @trip3, @trip4, @trip1]
      end
    end

    describe 'instance methods' do
      it 'trip#similar_trips' do
        expect(@trip4.similar_trips).to include @trip3
        expect(@trip4.similar_trips).to_not include @trip4
      end
    end
  end

end
