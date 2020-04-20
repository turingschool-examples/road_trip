class TriptravelersController < ApplicationController

  def destroy
    trip_traveler = TripTraveler.find_by(trip_id: params[:id], traveler_id: params[:traveler_id])
    TripTraveler.destroy(trip_traveler.id)
    redirect_to "/trips/#{params[:id]}"
  end

end
