class TripsController < ApplicationController

  def index
    @trips = Trip.all.order(mileage: :asc)
  end

  def show
    @trip = Trip.find(params[:id])
  end


end
