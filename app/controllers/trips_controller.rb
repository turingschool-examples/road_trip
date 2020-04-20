class TripsController < ApplicationController

  def index
    @trips = Trip.mileage_sort
  end

  def show
    @trip = set_trip
  end

  def destroy
    #could put onto traveler controller time permitting
    set_trip.travelers.destroy(params[:traveler])

    redirect_to "/trips/#{params[:id]}"
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end
end
