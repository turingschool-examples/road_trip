class TripsController < ApplicationController

  def index
    @trips = Trip.order(:miles)
  end

  def show
    @trip = Trip.find(params[:trip_id])
  end

end
