class TripsController < ApplicationController

  def index
    @traveler = Traveler.find(params[:id])
    # @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def remove_traveler
    traveler = Traveler.find(params[:id])
    trip = Trip.find(params[:trip_id])
    x = TripTraveler.find_by(trip_id: trip.id, traveler_id: traveler.id)
    x.destroy

    redirect_to "/trips/#{trip.id}"
  end

end