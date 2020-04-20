class TripsController < ApplicationController

  def index
    @trips = Trip.trips_by_mileage_ascending
  end

end
