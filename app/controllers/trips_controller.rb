class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
    @trips = Trip.all
  end

  def destroy
    trip = Trip.find(params[:trip_id])
    trip.travelers.delete(params[:traveler_id])
    redirect_to "/trips/#{trip.id}"
  end
end