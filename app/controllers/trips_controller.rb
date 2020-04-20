class TripsController < ApplicationController

  def index
    @trips = Trip.order(:mileage)
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    trip = Trip.find(params[:trip_id])
    traveler = Traveler.find(params[:traveler_id])
    trip.travelers.delete(traveler)
    redirect_to "/trips/#{trip.id}"
  end


end
