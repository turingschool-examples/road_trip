class TripsController < ApplicationController
  
  def create 

    traveler = Traveler.find(params[:traveler_id])
    new_trip = Trip.find(params[:Trip_ID])
    TravelerTrip.create!(trip_id: new_trip.id, traveler_id: traveler.id)
    redirect_to "/travelers/#{traveler.id}"
  end
end