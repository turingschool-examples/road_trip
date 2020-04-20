require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe "relationships" do
    it { should have_many :traveler_trips}
    it { should have_many(:travelers).through(:traveler_trips)}
  end
end
