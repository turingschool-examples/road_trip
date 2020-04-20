class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def destroy
    trip = Trip.find(params[:trip_id])
    traveler = trip.travelers.delete(params[:traveler_id])
    redirect_to "/trips/#{trip.id}"
  end
end