require 'rails_helper'

RSpec.describe TripsTraveler, type: :model do
  describe 'relationships' do
    it { should belong_to :trip }
    it { should belong_to :traveler }
  end
end
