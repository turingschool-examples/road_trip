require 'rails_helper'

describe Trip, type: :model do

  describe 'relationships' do
    it { should have_many :traveler_trips}
    it { should have_many(:travelers).through(:traveler_trips) }
  end
end