require 'rails_helper'

describe TripTraveler, type: :model do
  # describe "validations" do
  #   it { should validate_presence_of :FIELD }
  # end

  describe 'relationships' do
    it { should belong_to :trip }
    it { should belong_to :traveler }
  end
end
