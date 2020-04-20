class TripsController < ApplicationController

  def index
    @trips = Trip.order(:mileage)
  end

  def show
    @trip = Trip.find(params[:id])
    @trips = Trip.where(destination: "#{@trip.destination}")
  end
end
