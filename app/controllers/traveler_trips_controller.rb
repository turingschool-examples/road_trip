class TravelerTripsController < ApplicationController
  def destroy
    TravelerTrip.find_by(traveler_id:params[:id]).destroy
    redirect_to request.referer
  end
end
