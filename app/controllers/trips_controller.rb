class TripsController < ApplicationController
  def index
    @trips = Trip.sorted_trips
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def update
    trip = Trip.find(params[:id])
    trip.travelers.destroy(params[:traveler_id])
    redirect_to trip_path(trip)
  end
end
