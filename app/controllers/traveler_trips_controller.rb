class TravelerTripsController < ApplicationController
  def create
    TravelerTrip.create(trip_id: params[:trip_id], traveler_id: params[:id])
    redirect_to "/travelers/#{params[:id]}"
  end
end
