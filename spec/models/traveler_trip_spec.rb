require 'rails_helper'

describe TravelerTrip do
  describe "relationships" do
    it { should belong_to :trip }
    it { should belong_to :traveler }
  end
end
