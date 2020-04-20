class TripTravelersController < ApplicationController

  def destroy
    traveler = Traveler.find(params[:traveler_id])
    traveler.trips.destroy(params[:trip_id])

    redirect_to "/trips/#{params[:trip_id]}"
  end
end
