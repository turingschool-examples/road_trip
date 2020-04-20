class TravelerTripsController < ApplicationController
  def destroy
    traveler_trip = TravelerTrip.find_by("traveler_id = ?", params[:traveler_id])
    TravelerTrip.destroy(traveler_trip.id)
    redirect_to "/trips/#{params[:trip_id]}"
  end
end