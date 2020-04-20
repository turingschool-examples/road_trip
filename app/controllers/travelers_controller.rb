class TravelersController < ApplicationController

  def destroy
    traveler = Traveler.find(params[:traveler_id])
    trip_id = TripTraveler.find(params[:traveler_id]).trip_id
    trip = Trip.find(trip_id)
    traveler.destroy
    redirect_to "/trips/#{trip_id}"
  end
end
