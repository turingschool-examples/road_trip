class TravelerTripsController < ApplicationController
  def destroy
    traveler = find_traveler
    trip = find_trip
    traveler_trip = traveler.find_traveler_trip(trip.id)
    delete_traveler_trip(traveler_trip)
  end

  private
  def find_trip
    Trip.find(params[:trip_id])
  end

  def find_traveler
    Traveler.find(params[:traveler_id])
  end

  def delete_traveler_trip(traveler_trip)
    traveler_trip.delete
    redirect_to "/trips/#{params[:trip_id]}"
  end
end