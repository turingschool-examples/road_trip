require 'rails_helper'

describe Trip, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :destination_city }
    it { should validate_presence_of :mileage }
  end

  describe 'relationships' do
    it { should have_many :travelers }
  end
end
