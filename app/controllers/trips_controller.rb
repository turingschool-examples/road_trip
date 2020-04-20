class TripsController < ApplicationController
  def index
    trips = Trip.all
    @sorted_trips = trips.sort_by { |trip| trip.mileage }
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
