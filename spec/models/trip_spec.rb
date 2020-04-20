require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :destination }
    it { should validate_presence_of :mileage }
  end

  describe 'relationships' do
    it { should have_many :trips_travelers }
    it { should have_many :travelers }
  end
end
