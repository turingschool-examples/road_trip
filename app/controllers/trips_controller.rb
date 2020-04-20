class TripsController < ApplicationController

  def index
    @trips = Trip.all.order(mileage: :asc)
  end


end
