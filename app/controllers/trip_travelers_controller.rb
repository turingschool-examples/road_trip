class TripTravelersController < ApplicationController
  def destroy
    traveler = TripTraveler.find_by(trip_id: params[:trip_id], traveler_id: params[:traveler_id])
    TripTraveler.destroy(traveler.id)
    redirect_to "/trips/#{params[:trip_id]}"
  end
end
