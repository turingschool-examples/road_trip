require "rails_helper"

RSpec.describe Trip, type: :model do

  describe "Validations" do
    it {should validate_presence_of :title}
    it {should validate_presence_of :destination_city}
    it {should validate_presence_of :mileage}
  end

  describe "Relationships" do

  end

  describe "Instance Methods" do

  end

end
