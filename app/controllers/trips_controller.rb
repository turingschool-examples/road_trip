class TripsController < ApplicationController

  def index
    @traveler = Traveler.find(params[:id])
    # @trips = Trip.all
  end

end