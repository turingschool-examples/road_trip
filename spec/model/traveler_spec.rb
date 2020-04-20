require "rails_helper"

RSpec.describe Traveler, type: :model do

  it "Validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end

  it "Relationships" do

  end

  it "Instance Methods" do

  end

end
