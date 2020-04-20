class TripsController < ApplicationController 
  def index 
    @trips = Trip.by_mileage
  end

  def show 
    @trip = Trip.find(params[:id])
  end

  def destroy
    trip = Trip.find(params[:id])
    binding.pry
  end
end