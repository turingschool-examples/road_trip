require 'rails_helper'

describe Traveler do
  describe "relationships" do
    it { should have_many :trips }
    it { should have_many :traveler_trips }
  end
end
