class TravelerTripsController < ApplicationController

  def destroy
    traveler_trip = TravelerTrip.find_by(destroy_params)
    traveler_trip.destroy
    redirect_to trip_path(params[:trip_id])
  end

  private

  def destroy_params
    params.permit(:traveler_id, :trip_id)
  end
end
