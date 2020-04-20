require 'rails_helper'

RSpec.describe Traveler do
  describe "relationships" do
    it { should have_many(:traveler_trips) } 
    it { should have_many(:trips).through(:traveler_trips)}
  end
end