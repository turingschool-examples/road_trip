require 'rails_helper'

describe TravelerTrip, type: :model do

  describe 'relationships' do
    it { should belong_to :traveler }
    it { should belong_to :trip }
  end
end