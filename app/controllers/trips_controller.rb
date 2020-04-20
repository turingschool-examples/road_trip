class TripsController < ApplicationController
  def index
    trips = Trip.all
    @sorted_trips = trips.sort_by { |trip| trip.mileage }
  end
end
