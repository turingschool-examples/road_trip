require "rails_helper"

RSpec.describe Traveler, type: :model do

  describe "Validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end

  describe "Relationships" do

  end

  describe "Instance Methods" do

  end

end
