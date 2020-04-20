require 'rails_helper'

RSpec.describe Trip, type: :model do
    it { should have_many :trip_travelers}
    it { should have_many(:travelers).through(:trip_travelers)}
end