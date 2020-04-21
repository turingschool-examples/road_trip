class TravelerTripsController < ApplicationController

    # def new
        
    # end
    
    
    # def create
    #     # binding.pry
    # end

    def add_trip
        binding.pry
        traveler = Traveler.find(params[:id])
        trip = Trip.find(params[:id])
        TravelerTrip.create(traveler_id: traveler.id, trip_id: trip.id)
        redirect_to "/travelers/:id"
    end
    
end