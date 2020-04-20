class TripsController < ApplicationController

  def index
    @trips = Trip.order_by_mileage_asc
  end

  def show
    @trip = Trip.find(params[:id])
  end

end