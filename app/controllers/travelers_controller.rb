class TravelersController < ApplicationController
  def destroy
    trip = Trip.find(params[:trip_id])
    traveler = Traveler.find(params[:id])
    trip.remove_traveler(traveler)
    redirect_to trip_path(trip)
  end
end