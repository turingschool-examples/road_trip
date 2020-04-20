require 'rails_helper'

RSpec.describe Traveler, type: :model do 
  describe "relationships" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should have_many :traveler_trips}
    it {should have_many(:trips).through(:traveler_trips)}
  end 
end