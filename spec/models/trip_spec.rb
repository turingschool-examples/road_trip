require "rails_helper"

RSpec.describe Trip, type: :model do

  describe 'Relationships' do
    it {should have_many :trip_travelers}
    it {should have_many(:travelers).through(:trip_travelers)}
  end

  describe "Validations" do
    it {should validate_presence_of :title}
    it {should validate_presence_of :destination_city}
    it {should validate_presence_of :mileage}
  end

end
