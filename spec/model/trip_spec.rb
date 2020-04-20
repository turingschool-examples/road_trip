require "rails_helper"

RSpec.describe Trip, type: :model do

  it "Validations" do
    it {should validate_presence_of :title}
    it {should validate_presence_of :destination_city}
    it {should validate_presence_of :mileage}
  end

  it "Relationships" do

  end

  it "Instance Methods" do

  end

end
