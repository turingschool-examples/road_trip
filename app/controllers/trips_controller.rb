class TripsController < ApplicationController

  def index
    @trips = Trip.all.order(:mileage)
  end
end
