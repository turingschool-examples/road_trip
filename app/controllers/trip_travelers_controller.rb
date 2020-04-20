class TripTravelersController < ApplicationController
  def destroy
    trip = params[:trip_id]
    traveler = TripTraveler.where(traveler_id: params[:traveler_id], trip_id: params[:trip_id])
    traveler.destroy_all
    redirect_to "/trips/#{trip}"
  end
end
