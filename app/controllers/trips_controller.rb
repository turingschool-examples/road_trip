class TripsController < ApplicationController

  def index
    @trips = Trip.order(:mileage)
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def update
    remove_traveler
    redirect_to trip_path(params[:id])
  end

  private

  def remove_traveler
    trip = Trip.find(params[:id])
    trip.travelers.delete(params[:traveler_id])
    trip.save
  end

end
