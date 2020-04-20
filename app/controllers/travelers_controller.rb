class TravelersController < ApplicationController
  
  def destroy
    trip = Trip.find(params[:trip_id])
    traveler = Traveler.find(params[:traveler_id])
    trip.travelers.destroy(params[:traveler_id])
    trip.save 
    redirect_to "/trips/#{trip.id}"
  end
  
end