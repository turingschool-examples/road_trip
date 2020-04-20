class TripsController < ApplicationController
  def index
    @trips = Trip.order_by_mileage
  end
end