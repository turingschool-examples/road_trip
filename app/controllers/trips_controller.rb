class TripsController < ApplicationController

  def index
    @trips = Trip.order(:mileage)
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def update
    trip = Trip.find(params[:id])
    trip.travelers.delete(params[:traveler_id])
    trip.save
    redirect_to trip_path(trip.id)
  end

end
