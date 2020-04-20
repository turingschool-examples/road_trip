require 'rails_helper'

describe Trip, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :destination }
    it ( should validate_presence_of :mileage)
  end

  describe "relationships" do
    it {should have_many :traveler_trips}
    it {should have_many(:travelers).through(:traveler_trips)}
  end
