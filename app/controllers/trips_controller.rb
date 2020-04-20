class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def destroy
    Trip.find(params[:id]).travelers.destroy(params[:traveler])
    redirect_to "/trips/#{params[:id]}"
  end
end
