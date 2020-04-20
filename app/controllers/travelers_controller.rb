class TravelersController < ApplicationController

  def destroy
    trip = Trip.find(params[:id])
    traveler = Traveler.find(params[:traveler_id])
    trip.road_trip_travelers.destroy(params[:traveler_id])
    traveler.destroy
    redirect_to "/trips/#{trip.id}"
  end
end
