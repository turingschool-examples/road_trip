class TravelersTripsController < ApplicationController

  def destroy
    @trip = Trip.find(params[:id])
    TripsTraveler.where(trip_id: @trip.id, traveler_id: params[:traveler]).destroy_all
    redirect_to trip_path(@trip)
  end

end