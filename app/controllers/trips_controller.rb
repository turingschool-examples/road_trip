class TripsController < ApplicationController
  def index
    @trips = Trip.order_by_mileage
  end

  def show
    @trip = Trip.find(params[:trip_id])
  end
end