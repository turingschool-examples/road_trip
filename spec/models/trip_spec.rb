require "rails_helper"

describe Trip, type: :model do
  describe "relationships" do
    it {should have_many :trip_travelers}
    it {should have_many(:travelers).through(:trip_travelers)}
  end
end
