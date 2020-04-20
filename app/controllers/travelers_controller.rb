class TravelersController < ApplicationController

  def destroy
    @trip = Trip.find(params[:trip_id])
    TripsTraveler.where(trip_id: @trip.id, traveler_id: params[:id]).destroy_all
    redirect_to trip_path(@trip)
  end

end