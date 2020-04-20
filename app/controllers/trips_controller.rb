class TripsController < ApplicationController
  def index
    @trips = Trip.sorted_trips
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def update
    trip = Trip.find(params[:id])
    travler = Traveler.find(params[:traveler_id])
    trip.travelers.destroy(travler)
    redirect_to trip_path(trip)
  end
end
