class TripsController < ApplicationController
  def index
    @trips = Trip.order(:mileage)
  end
end