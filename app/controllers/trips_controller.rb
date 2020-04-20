class TripsController < ApplicationController
  def index
    @trips = Trip.ordered
  end
end
