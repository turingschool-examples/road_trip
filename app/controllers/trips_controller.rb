class TripsController < ApplicationController
  def create
    traveler = Traveler.find(params[:traveler_id])
    trip = traveler.trips.create!(trip_params)
    trip.save!
    redirect_to "/travelers/#{traveler.id}"
  end

  private

  def trip_params
    params.permit(:title, :destination, :mileage)
  end
end
