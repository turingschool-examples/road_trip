require 'rails_helper'

RSpec.describe Traveler do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end

  describe "relationships" do
    it {should have_many :traveler_trips}
    it {should have_many(:trips).through(:traveler_trips)}
  end
end