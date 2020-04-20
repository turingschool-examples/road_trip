class TravelerTripsController < ApplicationController
    def destroy
        # binding.pry
        # trip = Trip.find(params[:id])
        # traveler = Traveler.find(params[:traveler_id])
        traveler = TravelerTrip.find_by(trip_id: params[:id], traveler_id: params[:traveler_id])
        # trip.travelers.delete(traveler)
        traveler1.destroy
        # @trip.travelers.delete(@traveler)
        redirect_to "/trips/#{params[:trip]}"
    end
    
end