class TravelersController < ApplicationController

  def show
    @traveler = Traveler.find(params[:id])
  end

  def update
    trip = Trip.find(params[:trip_id])
    traveler = Traveler.find(params[:id])
    trip.traveler_trips.create(traveler_id: traveler.id, trip_id: trip.id)
    redirect_to "/travelers/#{traveler.id}"
  end
end
