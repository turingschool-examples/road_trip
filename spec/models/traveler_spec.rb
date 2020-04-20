require 'rails_helper'

describe Traveler, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
  end

  describe 'relationships' do
    it { should have_many :trip_travelers }
    it { should have_many(:trips).through(:trip_travelers) }
  end
end
