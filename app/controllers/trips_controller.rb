class TripsController < ApplicationController

  def index
    @trips = Trip.by_mileage
  end

end
