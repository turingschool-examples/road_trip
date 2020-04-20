class TripsController < ApplicationController
  def index
    @trips = Trip.order(mileage: :asc)
  end
end
