class TripsController < ApplicationController

  def index
    @traveler = Traveler.find(params[:id])
    # @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

end