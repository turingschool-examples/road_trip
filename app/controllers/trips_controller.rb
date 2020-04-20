class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:trip_id])
  end

  def destroy
    trip = Trip.find(params[:trip_id])
    traveler = Traveler.find(params[:traveler_id])
    trip.remove_traveler(traveler)

    flash[:success] = "#{traveler.name} has been removed from this trip"
    redirect_to "/trips/#{trip.id}"
  end


end
