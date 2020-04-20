require "rails_helper"

RSpec.describe TravelerTrip, type: :model do
  describe "relationships" do
    it { should belong_to :traveler }
    it { should belong_to :trip }
  end
end
