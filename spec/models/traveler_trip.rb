require 'rails_helper'

Rspec.describe TravelerTrip do 
    describe "relationships" do
        it { should belong_to :traveler}
        it { should belong_to :trip}
    end  
end