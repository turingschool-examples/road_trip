class TravelerTripsController < ApplicationController

  def destroy
    TravelerTrip.delete(TravelerTrip.where(trip: params[:id], traveler: params[:traveler_id]))
    redirect_to "/trips/#{params[:id]}"
  end
end
