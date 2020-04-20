require "rails_helper"

RSpec.describe Traveler, type: :model do

  describe 'Relationships' do
    it {should have_many :trip_travelers}
    it {should have_many(:trips).through(:trip_travelers)}
  end

  describe "Validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end
  
end
