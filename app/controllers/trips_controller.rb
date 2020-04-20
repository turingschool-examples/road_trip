class TripsController < ApplicationController
  def index
    @trips = Trip.all
    @trips_ordered = @trips.order(mileage: :asc)
  end

  def show
    @trip = Trip.find(params[:id])
  end
end
