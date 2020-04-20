require 'rails_helper'

RSpec.describe TripTraveler, type: :model do
    it { should belong_to :trip}
    it { should belong_to :traveler}
end