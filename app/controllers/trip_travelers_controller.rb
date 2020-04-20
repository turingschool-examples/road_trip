class TripTravelersController < ApplicationController

  def destroy
    trip_traveler = TripTraveler.find(params[:id])
    trip_traveler.destroy
    redirect_to trip_path(trip_traveler.trip)
  end
end