class TripsController < ApplicationController

  def index
    @trips = Trip.order(:miles)
  end

end
