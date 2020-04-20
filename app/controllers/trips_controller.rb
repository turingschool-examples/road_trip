class TripsController < ApplicationController

  def index
    @trips = Trip.all.order("mileage ASC")
  end

  def show 
    @trip = Trip.find(params[:trip_id])
  end  
end