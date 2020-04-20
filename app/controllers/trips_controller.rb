class TripsController < ApplicationController
  def index
    trips = Trip.all
    @sorted_trips = trips.sort_by { |trip| trip.mileage }
  end

  def show
    @trip = Trip.find(params[:id])
  end
end
