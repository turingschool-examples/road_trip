require 'rails_helper'

RSpec.describe Traveler, type: :model do
    it { should have_many :trip_travelers}
    it { should have_many(:trips).through(:trip_travelers)}

    it "trips_ordered" do
        #need test
    end
end