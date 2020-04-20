class TravelerTripsController < ApplicationController
  def destroy
    traveler_trip = TravelerTrip.find(params[:id])
    traveler_trip.delete_traveler
    redirect_to trip_path(traveler.trips.ids.first)
  end
end