require 'rails_helper'

RSpec.describe Traveler, type: :model do
  describe 'relationships' do
    it {should have_many :road_trip_travelers}
    it {should have_many(:trips).through(:road_trip_travelers)}
  end
end
