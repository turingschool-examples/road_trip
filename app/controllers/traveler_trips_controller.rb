class TravelerTripsController < ApplicationController 
  def create 
    traveler = Traveler.find(params[:id])
    trip = Trip.find(params[:trip_id])
    TravelerTrip.create(traveler: traveler, trip: trip)
    redirect_to "/travelers/#{traveler.id}"
  end
end