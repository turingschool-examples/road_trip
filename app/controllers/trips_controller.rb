class TripsController < ApplicationController

  def index
    @trips = Trip.trips_by_mileage_ascending
  end

  def show
    @trip = Trip.find(trip_params[:id])
  end

  private

  def trip_params
    params.permit(:id)
  end

end
